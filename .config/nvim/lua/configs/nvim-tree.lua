-- kyazdani42/nvim-tree.lua

local line_ok, tree = pcall(require, "nvim-tree")

if not line_ok then
	return
end

tree.setup({
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

