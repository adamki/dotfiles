local line_ok, lualine = pcall(require, "lualine")

if not line_ok then
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {
                'Outline',
                'NvimTree'
            },
            winbar = {},
        },
        ignore_focus = {
            'Outline',
            'NvimTree'
        },
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {},
        lualine_b = { 'branch', 'diff' },
        lualine_c = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                padding = {
                    left = 1,
                    right = 1,
                },
            }
        },
        lualine_x = { 'diagnostics', "require'lsp-status'.status()" },
        lualine_y = { 'fileformat' },
        lualine_z = { 'filetype' },
    },
    inactive_sections = {
        lualine_c = {
            {
                'filename',
                path = 1,
                padding = {
                    left = 1,
                    right = 1,
                },
            }
        },
    },
    tabline = {
        lualine_c = { 'tabs' },
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})
