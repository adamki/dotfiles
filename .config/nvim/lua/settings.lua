local o = vim.o
local bo = vim.bo
local wo = vim.wo
local set = vim.opt
local map = vim.api.nvim_set_keymap

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

vim.bo.swapfile = false
vim.wo.numberwidth = 3
vim.wo.wrap = false
vim.o.number = true
vim.o.relativenumber = true
set.showmode = false
set.wildmode = "list:longest,full"
vim.bo.undofile = true
vim.g.undodir = "~/.config/nvim/UNDO_HISTORY"
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- COC reqs
vim.g.nobackup = true
vim.g.nowritebackup = true
vim.g.updatetime = 300
vim.wo.signcolumn = "yes"

-- nvim.tree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- aesthetics
o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
