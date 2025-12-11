local o = vim.o
-- local wo = vim.wo
local set = vim.opt

-- Areas to set colorscheme
--     - bat/config
--     - wezterm config
--     - fzf/lua
--     - post-plugin-install-settings

-- ensure catppuccin plugin is loaded before this
require("catppuccin").setup({})

-- vim.cmd.colorscheme("catppuccin-latte")
vim.cmd.colorscheme("catppuccin-frappe")

-- nvim-tree requirement
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- nvim-treesitter
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

-- folke/which-key.nvim
o.timeout = true
o.timeoutlen = 400
