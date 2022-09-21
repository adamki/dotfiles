-- p00f/nvim-ts-rainbow

local line_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not line_ok then
	return
end

treesitter.setup {
  rainbow = {
    enable = true,
    disable = {}, -- list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 500, -- Do not enable for files with more than n lines, int
  }
}

