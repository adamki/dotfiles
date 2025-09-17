local line_ok, lualine = pcall(require, "lualine")

if not line_ok then
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {
                "aerial",
                "NvimTree",
                "fugitive",
            },
            winbar = {},
        },
        ignore_focus = {
            "aerial",
            "NvimTree",
        },
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = {
            {
                "filename",
                file_status = true, -- displays file status (readonly status, modified status)
                path = 1,
                max_length = vim.o.columns * 2 / 2,
            },
        },
        lualine_b = {
            "diff",
        },
        lualine_c = {},
        lualine_x = { "diagnostics", "lsp_status" },
        lualine_y = { "fileformat", "searchCount" },
        lualine_z = { "filetype" },
    },
    inactive_sections = {
        lualine_c = {
            {
                "filename",
                path = 1,
                shorting_target = 40,
                file_status = true,
            },
        },
    },
    tabline = {
        lualine_a = {
            {
                "tabs",
                tab_max_length = 40, -- Maximum width of each tab. The content will be shorten dynamically (example: apple/orange -> a/orange)
                max_length = vim.o.columns / 3, -- Maximum width of tabs component.
                mode = 2, -- 0: Shows tab_nr
                path = 0, -- 0: just shows the filename
            },
        },
        lualine_y = { "branch" },
        lualine_z = { "aerial" },
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {},
})
