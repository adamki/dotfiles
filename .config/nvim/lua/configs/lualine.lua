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
                'aerial',
                'NvimTree',
                'fugitive'
            },
            winbar = {
            },
        },
        ignore_focus = {
            'aerial',
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
        lualine_b = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                fmt = function(str)
                    local path_separator = package.config:sub(1, 1)
                    return str:gsub(path_separator, "")
                end
            }
        },
        lualine_c = {},
        lualine_x = { 'diff', 'diagnostics', "require'lsp-status'.status()" },
        lualine_y = { 'fileformat' },
        lualine_z = { 'filetype' },
    },
    inactive_sections = {
        lualine_c = {
            {
                'filename',
                path = 4,
                -- padding = {
                --     left = 1,
                --     right = 1,
                -- },
                shorting_target = 40,
                file_status = true,
            }
        },
    },
    tabline = {
        lualine_a = { 'tabs' },
        lualine_x = { 'branch' },
        lualine_y = { 'aerial' },
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})
