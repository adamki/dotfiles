local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use { "wbthomason/packer.nvim" } -- self manage packer

	-- colorschemes
	use { "sainnhe/gruvbox-material"}

	 -- syntax / highlighting
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ':TSUpdate',
		config = function()
			require"configs.nvim-treesitter"
		end
	}

	-- motions
	use { "tpope/vim-repeat" }
	use { "tpope/vim-surround" }
	use { "justinmk/vim-sneak" }
	use { "numToStr/Comment.nvim",
		config = function()
			require"Comment".setup()
		end
	}

	-- improved interface
	use {
		"windwp/nvim-ts-autotag",
		config = function()
			require"configs.nvim-treesitter"
		end
	}
	use { "lukas-reineke/indent-blankline.nvim" }
	use { "tpope/vim-eunuch" }
	use {
		"nvim-tree/nvim-tree.lua",
		config = function()
			require"configs.nvim-tree"
		end,
	}
	use {
		"simrat39/symbols-outline.nvim" ,
		config = function()
			require("symbols-outline").setup()
		end
	}
	use {
		'feline-nvim/feline.nvim',
		branch = '0.5-compat',
		config = function ()
			require("configs.feline")
		end
	}

	-- GIT integrations
	use { "tpope/vim-fugitive" }
	use { "tpope/vim-rhubarb" }
	use { "shumphrey/fugitive-gitlab.vim" }
	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require'gitsigns'.setup()
		end
	}

	-- fzf.vim
	use {
		'junegunn/fzf.vim',
		requires = { 'junegunn/fzf', run = ':call fzf#install()' }
	}

	-- LSP
	use {
		"VonHeikemen/lsp-zero.nvim",
		config = function()
			require"configs.lsp-zero"
		end,
		branch = 'v2.x',
		requires = {
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

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
