local line_ok, lualine = pcall(require, "lualine")

if not line_ok then
  return
end

lualine.setup ({
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
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
    lualine_b = {'branch', 'diff'},
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    lualine_x = {},
    lualine_y = {'fileformat', 'filetype', 'diagnostics'},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        path=1
      }
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_c = {'tabs'},
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})
