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

-- aesthetics
o.background = "dark"

-- PLUGINS
-- nvim-tree requirement
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- nvim-treesitter
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

-- junegenn/fzf.vim
vim.g.fzf_command_prefix = "Fuzzy"
vim.g.fzf_history_dir = "~/.local/share/fzf-history"
vim.g.fzf_buffers_jump = 1

-- folke/which-key.nvim
o.timeout = true
o.timeoutlen = 400
