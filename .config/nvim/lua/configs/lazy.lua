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
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme gruvbox-material]])
    end,
  },

  -- Syntax / Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require"configs.nvim-treesitter"
    end,
    build = 'TSUpdate',
  },

  -- Motions
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
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
    end
  },
  { "lukas-reineke/indent-blankline.nvim" },
  { "tpope/vim-eunuch" },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require"configs.nvim-tree"
    end
  },
  {
    "simrat39/symbols-outline.nvim" ,
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
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "shumphrey/fugitive-gitlab.vim" },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require'gitsigns'.setup()
    end
  },

  -- FZF
  {
    'junegunn/fzf.vim',
    dependencies  = {
      'junegunn/fzf',
      build = ':call fzf#install()'
    },
  },

  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    config = function()
      require"configs.lsp-zero"
    end,

    branch = 'v2.x',
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
        end
      },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "saadparwaiz1/cmp_luasnip" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
    }
  }
})
