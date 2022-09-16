local o = vim.o
local bo = vim.bo
local wo = vim.wo
local set = vim.opt

-- general settings
vim.syntax = true
vim.encoding = "utf8"
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.cmd [[set mouse=a]]
set.clipboard = 'unnamedplus'
vim.g.nopaste = true
set.pastetoggle = '<F6>'
set.splitbelow = true
set.splitright = true

bo.swapfile = false
wo.numberwidth = 3
wo.wrap = false
o.number = true
o.relativenumber = true
set.showmode = false
set.wildmode = "list:longest,full"
vim.cmd[[set undofile]]
vim.g.undodir = "~/.config/nvim/UNDO_HISTORY"
o.scrolloff = 8
o.sidescrolloff = 8
o.foldlevel=20

-- aesthetics
o.background = "dark"
vim.cmd([[colorscheme everforest]])

-- PLUGINS
-- nvim-tree requirement
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- nvim-treesitter
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

-- alvan/vim-closetag
vim.g.closetag_filenames = '*.html,*.jsx,*.js,*.tsx,*.html.erb'

-- junegenn/fzf.vim
vim.g.fzf_command_prefix = 'Fuzzy'
vim.g.fzf_history_dir = '~/.local/share/fzf-history'
vim.g.fzf_buffers_jump = 1
