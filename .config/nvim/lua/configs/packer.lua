return require("packer").startup(function(use)
	use { "wbthomason/packer.nvim" } -- self manage packer
	 -- colorschemes
	 use { "ellisonleao/gruvbox.nvim" }
	 use { "sainnhe/everforest" }

	 -- syntax / highlighting
	 use {
	 	"nvim-treesitter/nvim-treesitter",
	 	run = ":TSUpdate",
	 	config = function()
	 		require"configs.nvim-treesitter"
	 	end
	 }

	 -- motions
	 use { "alvan/vim-closetag" }
	 use { "tpope/vim-repeat" }
	 use { "tpope/vim-surround" }
	 use { "justinmk/vim-sneak" }
	 use { "numToStr/Comment.nvim",
	 	config = function()
	 		require"Comment".setup()
	 	end
	 }

	 -- improved interface
	 use { "lukas-reineke/indent-blankline.nvim" }
	 use { "tpope/vim-eunuch" }
	 use {
	 	"kyazdani42/nvim-tree.lua",
	 	requires = { "kyazdani42/nvim-web-devicons" },
	 	config = function()
	 		require"configs.nvim-tree"
	 	end,
	 }
	 use {
	 	"p00f/nvim-ts-rainbow",
	 	config = function()
	 		require"configs.nvim-ts-rainbow"
	 	end
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
	use { 'nvim-lualine/lualine.nvim' }

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
	 	"junegunn/fzf",
	 	"junegunn/fzf.vim"
	 }

	 -- LSP
	 use {
	 	"VonHeikemen/lsp-zero.nvim",
	 	config = function()
	 		require"configs.lsp-zero"
	 	end,
	 	requires = {
	 		-- LSP Support
	 		{ "neovim/nvim-lspconfig" },
	 		{ "williamboman/mason.nvim" },
	 		{ "williamboman/mason-lspconfig.nvim" },
	 		-- Autocompletion
	 		{ "hrsh7th/cmp-buffer" },
	 		{ "hrsh7th/cmp-path" },
	 		{ "hrsh7th/cmp-nvim-lsp" },
	 		{ "hrsh7th/cmp-nvim-lua" },
	 		{ "saadparwaiz1/cmp_luasnip" },
	 		{
	 			"hrsh7th/nvim-cmp",
	 			config = function()
	 				require"configs.nvim-cmp"
	 			end
	 		},
	 		-- Snippets
	 		{ "L3MON4D3/LuaSnip" },
	 	}
	 }
end)
