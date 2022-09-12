return require('packer').startup(function(use)
  use { "wbthomason/packer.nvim" }
  use { "ellisonleao/gruvbox.nvim" }
  use { "sheerun/vim-polyglot" } -- replace with tree sitter. Tree sitter should also improve folding
	use { "alvan/vim-closetag" }
	use {
			"numToStr/Comment.nvim",
			config = function() require("Comment").setup() end
	}

	use { "tpope/vim-repeat" }
  use { "tpope/vim-surround" }
  use { "justinmk/vim-sneak" }
  use { "junegunn/fzf" }
  use { "junegunn/fzf.vim" }
	use { "lukas-reineke/indent-blankline.nvim" }
  use { "tpope/vim-eunuch" }
	use { "luochen1990/rainbow" }
	use { "tpope/vim-fugitive" }

  use { 'tpope/vim-rhubarb' }
  use { 'shumphrey/fugitive-gitlab.vim' }
  use { "neoclide/coc.nvim", branch = "release" } -- research and replace with neovim's native LSP
end)

