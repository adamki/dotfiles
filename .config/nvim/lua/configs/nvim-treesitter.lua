-- nvim-treesitter/nvim-treesitter
require 'nvim-treesitter.configs'.setup {
	ensure_installed = { -- A list of parser names, or "all"
		"bash",
		"html",
		"javascript",
		"json",
		"typescript",
		"python",
		"vim"
	},
	auto_install = true, -- Automatically install missing parsers when entering buffer
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = true
	},
  indent = {
    enable = true
  }
}

