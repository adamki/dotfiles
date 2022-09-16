-- p00f/nvim-ts-rainbow

require("nvim-treesitter.configs").setup {
  rainbow = {
    enable = true,
    disable = {}, -- list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 500, -- Do not enable for files with more than n lines, int
  }
}

