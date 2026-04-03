local ok, fzf = pcall(require, "fzf-lua")

if not ok then
    return
end

-- rg already respects .gitignore and .rgignore per-project.
-- Keep this config project-agnostic; use .rgignore in each repo
-- for project-specific exclusions of git-tracked noise.

local IGNORED_DIRS = {
    ".git",
}

local function build_glob_flags()
    local flags = {}
    for _, dir in ipairs(IGNORED_DIRS) do
        table.insert(flags, "--glob '!" .. dir .. "'")
    end
    return table.concat(flags, " ")
end

local RG_BASE = "--column --line-number --no-heading --color=always --smart-case --no-binary --hidden"
local RG_OPTS = RG_BASE .. " " .. build_glob_flags()

fzf.setup({
    "telescope",
    formatter = "path.filename_first",
    fzf_opts = {
        ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-history",
    },
    winopts = {
        width = 0.90,
        preview = {
            default = "bat",
            title = true,
            border = "rounded",
        },
    },
    files = {
        cmd = "rg --files --hidden " .. build_glob_flags(),
        cwd_prompt = true,
        history = 100,
    },
    grep = {
        rg_opts = RG_OPTS,
        cwd_prompt = true,
        silent = true,
        history = 100,
    },
    previewers = {
        bat = {
            args = "--style=numbers,changes,header-filename,header-filesize",
        },
    },
})

-- =============[ Helpers ]=============

local function grep_by_filetype()
    local fzf_l = require("fzf-lua")
    local type_list = vim.fn.systemlist("rg --type-list")
    fzf_l.fzf_exec(type_list, {
        prompt = "Filetype > ",
        actions = {
            ["default"] = function(selected)
                if not selected or #selected == 0 then
                    return
                end
                local type_name = selected[1]:match("^(%S+):")
                if type_name then
                    fzf_l.grep_project({
                        rg_opts = RG_OPTS .. " --type " .. type_name,
                    })
                end
            end,
        },
    })
end

-- =============[ Keymaps ]=============
local set = vim.keymap.set
local fzf_lua = require("fzf-lua")

-- Custom grep multiple subdirs picker
set("n", "<LocalLeader>G", function()
    local root = require("fzf-lua.path").git_root({}) or vim.fn.getcwd()
    local subdirs = vim.fn.glob(root .. "/*", 1, 1)
    subdirs = vim.tbl_filter(function(p)
        return vim.fn.isdirectory(p) == 1
    end, subdirs)

    fzf_lua.fzf_exec(subdirs, {
        prompt = "Use TAB to pick subdirs > ",
        fzf_opts = { ["--multi"] = true },
        actions = {
            ["default"] = function(selected)
                if not selected or vim.tbl_isempty(selected) then
                    return
                end
                fzf_lua.live_grep({ cwd = root, search_dirs = selected })
            end,
        },
    })
end, { desc = "FzfLua grep multi dirs" })

-- Standard mappings
set("n", "<LocalLeader>,", ":FzfLua<CR>", { desc = "FzfLua main menu" })
set("n", "<LocalLeader>f", ":FzfLua files<CR>", { desc = "FzfLua files" })
set("n", "<LocalLeader>g", ":FzfLua grep_project<CR>", { desc = "FzfLua grep project" })
set("v", "<LocalLeader>g", ":FzfLua grep_visual<CR>", { desc = "FzfLua grep visual selection" })
set("n", "<LocalLeader><BS>", ":FzfLua grep_cword<CR>", { desc = "FzfLua cursor word" })
set("n", "<LocalLeader>b", ":FzfLua buffers<CR>", { desc = "FzfLua buffers" })
set("n", "<LocalLeader>j", ":FzfLua jumps<CR>", { desc = "FzfLua jump locations" })
set("n", "<LocalLeader>h", ":FzfLua help_tags<CR>", { desc = "FzfLua help_tags" })
set("n", "<LocalLeader>l", ":FzfLua blines<CR>", { desc = "FzfLua blines" })
set("n", "<LocalLeader>m", ":FzfLua marks<CR>", { desc = "FzfLua marks" })
set("n", "<LocalLeader>t", ":FzfLua tabs<CR>", { desc = "FzfLua tabs" })
set("n", "<localleader>?", ":FzfLua keymaps<CR>", { desc = "FzfLua keymaps" })
set("n", "<localleader>s", ":FzfLua colorschemes<CR>", { desc = "FzfLua colorschemes" })
set("n", "<localleader>/", ":FzfLua search_history<CR>", { desc = "FzfLua search_history" })
set("n", "<localleader>r", ":FzfLua command_history<CR>", { desc = "FzfLua command_history" })
set("n", "<localleader>y", ":FzfLua oldfiles<CR>", { desc = "FzfLua old_files" })
set("n", "<localleader>C", ":FzfLua git_bcommits<CR>", { desc = "FzfLua git_bcommits" })
set("n", "<localleader>c", ":FzfLua git_commits<CR>", { desc = "FzfLua git_commits" })

set("n", "<LocalLeader><space>", ":FzfLua resume<CR>", { desc = "FzfLua resume last picker" })
set("n", "<LocalLeader>T", grep_by_filetype, { desc = "FzfLua grep by filetype" })

-- Grep with no ignore rules (bypasses .gitignore and .rgignore)
set("n", "<LocalLeader>A", function()
    fzf_lua.grep_project({
        rg_opts = RG_OPTS .. " --no-ignore",
    })
end, { desc = "FzfLua grep all (no ignore)" })
