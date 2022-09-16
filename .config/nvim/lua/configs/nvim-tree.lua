-- kyazdani42/nvim-tree.lua

require("nvim-tree").setup({
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
		highlight_opened_files = "name",
  },
	actions = {
		open_file = {
			quit_on_open = true
		}
	}
})

