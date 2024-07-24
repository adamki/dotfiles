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
        full_name = true,
        special_files = {},
        symlink_destination = false,
        icons = {
            git_placement = "signcolumn",
            show = {
                file = true,
                folder = false,
                folder_arrow = false,
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
            quit_on_open = false
        }
    },
})
