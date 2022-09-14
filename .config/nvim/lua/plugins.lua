vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

return require('packer').startup(function(use)
	use { "wbthomason/packer.nvim" } -- self manage packer

	-- colors & highlighting
	use { "ellisonleao/gruvbox.nvim" }
	use { "sainnhe/everforest" }
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

	-- motions
	use { "alvan/vim-closetag" }
	use { "tpope/vim-repeat" }
	use { "tpope/vim-surround" }
	use { "justinmk/vim-sneak" }
	use { "numToStr/Comment.nvim" }

	-- improved interface
	use { "lukas-reineke/indent-blankline.nvim" }
	use { "tpope/vim-eunuch" }
	use { "p00f/nvim-ts-rainbow" }
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons',
		},
	}

	-- GIT integrations
	use { "tpope/vim-fugitive" }
	use { "tpope/vim-rhubarb" }
	use { "shumphrey/fugitive-gitlab.vim" }
	use { "lewis6991/gitsigns.nvim" }

	-- fzf.vim
	use {
		"junegunn/fzf",
		"junegunn/fzf.vim"
	}

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},
			-- Snippets
			{'L3MON4D3/LuaSnip'},
		}
	}
end)
