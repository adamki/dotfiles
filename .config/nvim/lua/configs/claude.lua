local M = {}

-- Tracks the single managed claude terminal (in-neovim)
local state = { buf = nil, chan = nil }

-- Tracks the target WezTerm pane for out-of-neovim sends
local wezterm_pane_id = nil

-- ---------------------------------------------------------------------------
-- Helpers
-- ---------------------------------------------------------------------------

local function get_visual_selection()
    local saved = vim.fn.getreg("z")
    vim.cmd('normal! "zy')
    local text = vim.fn.getreg("z")
    vim.fn.setreg("z", saved)
    return text
end

local function capture_context()
    return {
        filepath = vim.fn.expand("%:~:."),
        ft = vim.bo.filetype,
        start_line = vim.fn.line("'<"),
        end_line = vim.fn.line("'>"),
    }
end

local function build_message(selection, ctx)
    local header = ctx.filepath ~= "" and string.format("(%s lines %d-%d)\n\n", ctx.filepath, ctx.start_line, ctx.end_line) or ""
    return header .. "```" .. ctx.ft .. "\n" .. selection .. "\n```"
end

-- ---------------------------------------------------------------------------
-- In-Neovim terminal
-- ---------------------------------------------------------------------------

local function is_alive()
    return state.buf and vim.api.nvim_buf_is_valid(state.buf) and state.chan and state.chan > 0
end

local function open_float(buf)
    local width = math.floor(vim.o.columns * 0.85)
    local height = math.floor(vim.o.lines * 0.80)
    return vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        style = "minimal",
        border = "rounded",
        title = " Claude ",
        title_pos = "center",
    })
end

local function focus_or_split()
    if not (state.buf and vim.api.nvim_buf_is_valid(state.buf)) then
        return false
    end
    local win = vim.fn.bufwinid(state.buf)
    if win ~= -1 then
        vim.api.nvim_set_current_win(win)
    else
        open_float(state.buf)
    end
    vim.cmd("startinsert")
    return true
end

local function open_terminal(cmd)
    state.buf = vim.api.nvim_create_buf(false, true)
    open_float(state.buf)
    state.chan = vim.fn.termopen(cmd, {
        on_exit = function()
            vim.schedule(function()
                state.buf = nil
                state.chan = nil
            end)
        end,
    })
    vim.cmd("startinsert")
    return state.chan
end

local function send(chan, text, delay)
    vim.defer_fn(function()
        if chan and chan > 0 then
            vim.fn.chansend(chan, text .. "\n")
        end
    end, delay)
end

function M.ask(selection, ctx)
    local msg = build_message(selection, ctx)
    if is_alive() then
        focus_or_split()
        send(state.chan, msg, 0)
    else
        local chan = open_terminal("claude")
        send(chan, msg, 500)
    end
end

function M.continue(selection, ctx)
    local msg = build_message(selection, ctx)
    if is_alive() then
        focus_or_split()
        send(state.chan, msg, 0)
    else
        local chan = open_terminal("claude --continue")
        send(chan, msg, 500)
    end
end

function M.resume()
    if not focus_or_split() then
        open_terminal("claude --resume")
    end
end

function M.open()
    if not focus_or_split() then
        open_terminal("claude")
    end
end

-- ---------------------------------------------------------------------------
-- Clipboard helpers
-- ---------------------------------------------------------------------------

-- Copy raw selection text
function M.yank(selection)
    vim.fn.setreg("+", selection)
    vim.notify("Selection copied to clipboard", vim.log.levels.INFO)
end

-- Copy @filepath for Claude's file-reference syntax
function M.copy_file_ref(ctx)
    local ref = "@" .. ctx.filepath
    vim.fn.setreg("+", ref)
    vim.notify("Copied: " .. ref, vim.log.levels.INFO)
end

-- ---------------------------------------------------------------------------
-- WezTerm out-of-Neovim send
-- ---------------------------------------------------------------------------

local function wezterm_send(pane_id, text)
    local tmpfile = vim.fn.tempname()
    local lines = vim.split(text, "\n")
    vim.fn.writefile(lines, tmpfile)
    vim.fn.jobstart({
        "sh",
        "-c",
        string.format("wezterm cli send-text --pane-id %d < %s", pane_id, vim.fn.shellescape(tmpfile)),
    }, {
        on_exit = function()
            os.remove(tmpfile)
        end,
    })
end

local function wezterm_pick_pane(callback)
    local raw = vim.fn.system("wezterm cli list --format json 2>/dev/null")
    if vim.v.shell_error ~= 0 then
        vim.notify("wezterm cli unavailable", vim.log.levels.ERROR)
        return
    end

    local ok, panes = pcall(vim.json.decode, raw)
    if not ok or not panes then
        vim.notify("Failed to parse wezterm pane list", vim.log.levels.ERROR)
        return
    end

    local current = tonumber(vim.env.WEZTERM_PANE)
    local items = vim.tbl_filter(function(p)
        return p.pane_id ~= current
    end, panes)

    if #items == 0 then
        vim.notify("No other WezTerm panes found", vim.log.levels.WARN)
        return
    end

    vim.ui.select(items, {
        prompt = "Send to WezTerm pane:",
        format_item = function(p)
            local cwd = (p.cwd or ""):gsub("^file://[^/]*", ""):gsub(vim.env.HOME or "", "~")
            return string.format("[%d] %s  %s", p.pane_id, p.title or "?", cwd)
        end,
    }, function(p)
        if p then
            callback(p.pane_id)
        end
    end)
end

-- Send selection to remembered pane (or pick one)
function M.wezterm_send(selection, ctx)
    local msg = build_message(selection, ctx)
    if wezterm_pane_id then
        wezterm_send(wezterm_pane_id, msg)
    else
        wezterm_pick_pane(function(id)
            wezterm_pane_id = id
            wezterm_send(id, msg)
        end)
    end
end

-- ---------------------------------------------------------------------------
-- Keymaps
-- ---------------------------------------------------------------------------

local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
local function exit_visual()
    vim.api.nvim_feedkeys(esc, "nx", false)
end

local set = vim.keymap.set

set("v", "<leader>cc", function()
    local ctx, sel = capture_context(), get_visual_selection()
    exit_visual()
    if sel ~= "" then
        M.continue(sel, ctx)
    end
end, { desc = "Continue last Claude session with selection" })

set("v", "<leader>cw", function()
    local ctx, sel = capture_context(), get_visual_selection()
    exit_visual()
    if sel ~= "" then
        M.wezterm_send(sel, ctx)
    end
end, { desc = "Send selection to WezTerm pane" })

set("n", "<leader>cp", function()
    wezterm_pick_pane(function(id)
        wezterm_pane_id = id
        vim.notify(string.format("WezTerm target set to pane %d", id), vim.log.levels.INFO)
    end)
end, { desc = "Pick WezTerm target pane" })

return M
