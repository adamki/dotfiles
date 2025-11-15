local o = vim.o
-- local wo = vim.wo
local set = vim.opt

-- ensure catppuccin plugin is loaded before this
require("catppuccin").setup({})

local theme = vim.env.THEME or "dark"

if theme == "light" then
    vim.o.background = "light"
    vim.cmd.colorscheme("catppuccin-latte")
else
    vim.o.background = "dark"
    vim.cmd.colorscheme("catppuccin-frappe")
end

-- nvim-tree requirement
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- nvim-treesitter
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

-- folke/which-key.nvim
o.timeout = true
o.timeoutlen = 400
