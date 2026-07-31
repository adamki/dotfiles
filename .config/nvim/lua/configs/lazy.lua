local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

if not vim.uv.fs_stat(lazypath) then
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
    rocks = { enabled = false },
    -- colorschemes
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },

    -- Syntax / Highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        -- `main` is required for Neovim 0.12+ (the frozen `master` branch does not
        -- support it). It's a rewrite with a new API, configured in configs.nvim-treesitter.
        branch = "main",
        build = ":TSUpdate",
        config = function()
            require("configs.nvim-treesitter")
        end,
    },

    -- Motions
    {
        "tpope/vim-repeat",
    },
    {
        "tpope/vim-surround",
    },
    {
        "justinmk/vim-sneak",
    },

    -- Improved Interface
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("configs.indent-blankline")
        end,
    },
    {
        "tpope/vim-eunuch",
    },
    {
        "tpope/vim-rhubarb",
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("configs.nvim-tree")
        end,
    },
    {
        "stevearc/aerial.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("configs.aerial")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("configs.lualine")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = { delay = 1000 },
    },

    -- git integration
    {
        "tpope/vim-fugitive",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("configs.git-signs")
        end,
    },

    -- FZF
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("configs.fzf-lua")
        end,
    },

    -- LSP
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {},
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("configs.mason-lsp")
        end,
    },

    -- Conform (Formatting)
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.conform")
        end,
    },

    -- nvim-lint (Linting)
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("configs.nvim-linter")
        end,
    },

    -- Auto-completion
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",
        config = function()
            require("configs.blink-cmp")
        end,
    },
})
