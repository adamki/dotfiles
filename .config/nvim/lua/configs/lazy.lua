local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

require("lazy").setup({
    -- colorschemes
    {
        "sainnhe/gruvbox-material",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin-macchiato]])
        end,
    },
    -- Syntax / Highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require "configs.nvim-treesitter"
        end,
    },

    -- Motions
    { "tpope/vim-repeat" },
    { "tpope/vim-surround" },
    { "justinmk/vim-sneak" },
    {
        "numToStr/Comment.nvim",
        config = function()
            require "Comment".setup()
        end
    },

    -- Improved Interface
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require "configs.nvim-treesitter"
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            local highlight = {
                "CursorColumn",
                "Whitespace",
            }
            require("ibl").setup {
                indent = { highlight = highlight, char = "" },
                whitespace = {
                    highlight = highlight,
                    remove_blankline_trail = false,
                },
                scope = { enabled = true },
            }
        end
    },
    { "tpope/vim-eunuch" },
    { "tpope/vim-rhubarb" },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require "configs.nvim-tree"
        end
    },
    {
        "stevearc/aerial.nvim",
        config = function()
            require('aerial').setup()
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require "configs.lualine"
        end,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            opt = true,
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },

    -- git integration
    { "tpope/vim-fugitive" },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require "gitsigns".setup()
        end
    },

    -- FZF
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require "configs.fzf-lua"
        end
    },

    -- Lsp
    { 'mason-org/mason.nvim', opts = {} },
    {
        'mason-org/mason-lspconfig.nvim',
        dependencies = { 'neovim/nvim-lspconfig' },
        opts = {}
    },

    -- auto complete
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        config = function ()
            require "configs.blink-cmp"
        end
    }
})
