-- kyazdani42/nvim-tree.lua

local line_ok, tree = pcall(require, "nvim-tree")

if not line_ok then
	return
end

-- Custom Git reset function
local function git_reset_path()
  local api = require("nvim-tree.api")
  local node = api.tree.get_node_under_cursor()
  if not node then
    vim.notify("No node selected", vim.log.levels.WARN)
    return
  end

  local path = node.absolute_path

  -- Confirm before nuking changes
  local confirm = vim.fn.confirm("Reset changes in:\n" .. path .. " ?", "&Yes\n&No", 2)
  if confirm ~= 1 then return end

  -- Reset staged + working tree
  vim.fn.system({ "git", "restore", "--staged", "--worktree", path })

  vim.notify("Reset to HEAD: " .. path)

  -- Refresh nvim-tree and gitsigns if available
  require("nvim-tree").refresh()
  local ok_gs, gitsigns = pcall(require, "gitsigns")
  if ok_gs then gitsigns.refresh() end
end
require("nvim-tree").setup({
  view = { adaptive_size = true },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    -- Press `R` in the tree to reset the selected file or folder
    vim.keymap.set("n", "R", git_reset_path, opts("Git Reset File/Dir"))
  end,
})

tree.setup({
  view = {
    adaptive_size = true,
  },
  renderer = {
    full_name = true,
    special_files = {},
    symlink_destination = false,
    icons = {
      git_placement = "signcolumn",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
    group_empty = true,
    highlight_opened_files = "name",
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    api.config.mappings.default_on_attach(bufnr)

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Press R in nvim-tree to reset the selected file or folder
    vim.keymap.set("n", "R", git_reset_path, opts("Git Reset File/Dir"))
  end,
})

vim.keymap.set("n", "-", ":NvimTreeFindFileToggle<CR>", { remap = false, desc = "Toggle NvimTree" })
