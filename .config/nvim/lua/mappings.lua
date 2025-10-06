local set = vim.keymap.set

-- Basic file operations
set("n", "<Leader>w", ":w<CR>", { remap = false, desc = "Save file" })
set("n", "<Leader>q", ":q<CR>", { remap = false, desc = "Quit file" })
set("n", "<Leader>Q", ":q!<CR>", { remap = false, desc = "Quit without saving" })
set("n", "<Leader>x", ":x<CR>", { remap = false, desc = "Save and quit" })

-- Window management
set("n", "<LocalLeader>z", "<C-W>_<C-W><Bar>", { remap = false, desc = "Maximize current window" })
set("n", "<Up>", ":resize +2<CR>", { remap = false, desc = "Increase window height" })
set("n", "<Down>", ":resize -2<CR>", { remap = false, desc = "Decrease window height" })
set("n", "<Left>", ":vertical resize +2<CR>", { remap = false, desc = "Increase window width" })
set("n", "<Right>", ":vertical resize -2<CR>", { remap = false, desc = "Decrease window width" })
set("n", "<C-J>", "<C-W><C-J>", { remap = false, desc = "Move to window below" })
set("n", "<C-K>", "<C-W><C-K>", { remap = false, desc = "Move to window above" })
set("n", "<C-L>", "<C-W><C-L>", { remap = false, desc = "Move to window right" })
set("n", "<C-H>", "<C-W><C-H>", { remap = false, desc = "Move to window left" })

-- Buffer navigation
set("n", "]b", ":bnext<CR>", { remap = false, desc = "Next buffer" })
set("n", "[b", ":bprev<CR>", { remap = false, desc = "Prev buffer" })

-- Copy file path
set("n", "cp", ":let @+= expand('%') <CR>", { remap = false, desc = "Copy current file path to clipboard" })

-- Interactivesearch/replace
set("n", "<leader>S", function()
    local cword = vim.fn.expand("<cword>")
    local search = vim.fn.input("Search: ", cword) -- prefill with word under cursor
    local replace = vim.fn.input("Replace: ") -- empty prompt, cursor ready
    if search ~= "" then
        vim.cmd(string.format("%%s/%s/%s/gc", search, replace))
    end
end, { desc = "Interactive substitute word under cursor" })

-- Tabs
set("n", "tq", ":tabclose<CR>", { remap = false, desc = "Close current tab" })
set("n", "tt", ":tabnew<CR>", { remap = false, desc = "Open new tab" })

-- Cursor movement
set("n", "0", "^", { remap = false, desc = "Move to first non-blank character of line" })
set("i", "<C-f>", "<C-x><C-f>", { remap = false, desc = "File completion in insert mode" })

-- Visual mode improvements
set("v", "<", "<gv", { remap = false, desc = "Indent left and stay in visual mode" })
set("v", ">", ">gv", { remap = false, desc = "Indent right and stay in visual mode" })
set("v", "J", ":m '>+1<CR>gv=gv", { remap = false, desc = "Move selection down" })
set("v", "K", ":m '<-2<CR>gv=gv", { remap = false, desc = "Move selection up" })

-- Syntax debugging
set("n", "<F3>", function()
  local fn = vim.fn
  local line = fn.line(".")
  local col  = fn.col(".")

  -- synID / synIDattr / synIDtrans calls
  local sid1 = fn.synID(line, col, 1)
  local name1 = fn.synIDattr(sid1, "name")
  local sid1_trans = fn.synIDtrans(sid1)
  local name1_trans = fn.synIDattr(sid1_trans, "name")
  local fg = fn.synIDattr(sid1_trans, "fg#")

  local msg = string.format(
    "syn: %s  trans: %s  lo: %s  FG:%s",
    name1 or "<none>",
    name1_trans or "<none>",
    fn.synIDattr(fn.synID(line, col, 0), "name") or "<none>",
    fg or "<none>"
  )

  -- nicer output than echo: use notify (or nvim_echo if you prefer)
  vim.notify(msg, vim.log.levels.INFO, { title = "Syntax under cursor" })
end, { remap = false, desc = "Show syntax group info under cursor" })


-- Toggle relative numbers
set("n", "<F2>", function()
    if vim.fn.exists("#rnu_toggle_augroup#BufEnter#*") > 0 then
        vim.wo.relativenumber = false
        vim.api.nvim_command("autocmd! rnu_toggle_augroup")
    else
        vim.wo.relativenumber = true
        CreateRNUToggleAutocmd()
    end
end, { remap = false, desc = "Toggle relative line numbers" })

-- show diagnostics
vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.open_float(nil, {
        focus = false,
        source = "always", -- show the source (e.g., lsp) for the diagnostic
        header = "⚠ Diagnostics", -- optional header
        prefix = "● ", -- optional bullet/prefix for each line
    })
end, { desc = "Show diagnostics under cursor" })
