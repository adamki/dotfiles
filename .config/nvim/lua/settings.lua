local o = vim.o
local wo = vim.wo
local set = vim.opt

-- general settings
vim.syntax = true
vim.encoding = "utf8"
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.cmd([[set mouse=a]])
set.clipboard = "unnamedplus"
vim.g.nopaste = true
set.splitbelow = true
set.splitright = true

o.swapfile = false
wo.numberwidth = 3
wo.wrap = false
o.number = true
o.relativenumber = true
set.showmode = false
set.wildmode = "list:longest,full"
vim.cmd([[set undofile]])
vim.g.undodir = "~/.config/nvim/UNDO_HISTORY"
o.scrolloff = 8
o.sidescrolloff = 8
o.foldlevel = 20
wo.signcolumn = "yes:1"

vim.diagnostic.config({
    float = {
        border = "rounded", -- "single", "double", "shadow", etc.
    },
})

-- Set default options for floating previews (hover, signature help, etc.)
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Also set diagnostics float config
vim.diagnostic.config({
    float = { border = "rounded" },
})
