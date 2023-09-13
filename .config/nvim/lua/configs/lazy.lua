local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

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

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "sainnhe/gruvbox-material",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },

  -- Syntax / Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require"configs.nvim-treesitter"
    end,
    build = ":TSUpdate",
  },

  -- Motions
  { "tpope/vim-repeat" },
  { "tpope/vim-surround"  },
  { "justinmk/vim-sneak" },
  { "numToStr/Comment.nvim",
    config = function()
      require"Comment".setup()
    end
  },

  -- Improved Interface
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require"configs.nvim-treesitter"
    end,
  },
  { "lukas-reineke/indent-blankline.nvim" },
  { "tpope/vim-eunuch" },
  { "tpope/vim-rhubarb" },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require"configs.nvim-tree"
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end
  },
  {
    'feline-nvim/feline.nvim',
    branch = '0.5-compat',
    config = function ()
      require("configs.feline")
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },

  -- git integration
  { "lewis6991/gitsigns.nvim" },
  { "tpope/vim-fugitive" },
  { "shumphrey/fugitive-gitlab.vim" },

  -- FZF
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        "telescope",
        winopts={
          preview={
            default="bat"
          }
        },
      })
    end
  },

  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v2.x',
    config = function()
      require"configs.lsp-zero"
    end,

    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      {
        "hrsh7th/nvim-cmp",
        config = function()
          require"configs.nvim-cmp"
        end,
        dependencies = {
          -- completion packages
          "hrsh7th/cmp-cmdline",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-nvim-lua",
        }
      },

      -- Snippets
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
        dependencies = {
          "rafamadriz/friendly-snippets",
          "L3MON4D3/LuaSnip",
          "saadparwaiz1/cmp_luasnip",
        },
      },
    }
  }
})
