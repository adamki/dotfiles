-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Create a new configuration object
local config = wezterm.config_builder()

-- Font settings
config.font_size = 16
config.adjust_window_size_when_changing_font_size = false

-- Disable font ligatures
config.harfbuzz_features = {
    'calt=0',
    'clig=0',
    'liga=0',
}

-- Color scheme
config.color_scheme = 'catppuccin-macchiato'

-- Window size and appearance
config.initial_cols = 120
config.initial_rows = 28
config.native_macos_fullscreen_mode = false

-- Tab bar settings
config.use_fancy_tab_bar = false
config.tab_max_width = 100

-- Customize window frame (title bar) appearance
config.window_frame = {
    font_size = 14.0,
    active_titlebar_bg = '#333333',
    inactive_titlebar_bg = '#333333',
}

-- Keybindings
config.keys = {
    -- Launcher
    {
        key = 'l',
        mods = 'ALT',
        action = wezterm.action.ShowLauncher,
    },

    -- Pane navigation
    {
        key = '}',
        mods = 'CTRL|SHIFT',
        action = wezterm.action { ActivatePaneDirection = 'Next' },
    },
    {
        key = '{',
        mods = 'CTRL|SHIFT',
        action = wezterm.action { ActivatePaneDirection = 'Prev' },
    },

    -- Pane splitting
    {
        key = 'H',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'V',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },

    -- TODOadd zoom in/out pane
    --
    -- workspaces
    {
        key="w",
        mods="CTRL|SHIFT",
        action=wezterm.action.ShowLauncherArgs{flags="WORKSPACES"}
    },
}


-- Return the final configuration
return config
