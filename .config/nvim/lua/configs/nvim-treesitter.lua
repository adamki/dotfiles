-- nvim-treesitter/nvim-treesitter

local line_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not line_ok then
	return
end

treesitter.setup {
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
