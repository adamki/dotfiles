-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Create a new configuration object
local config = wezterm.config_builder()

-- Color scheme
config.adjust_window_size_when_changing_font_size = false
config.color_scheme = "catppuccin-macchiato"
config.font = wezterm.font("JetBrainsMono Nerd Font", {
	weight = "Medium",
})
config.font_size = 16
config.harfbuzz_features = {
	"calt=0",
	"clig=0",
	"liga=0",
}
config.initial_cols = 120
config.initial_rows = 28
config.native_macos_fullscreen_mode = false
config.tab_max_width = 100
config.window_frame = { font_size = 14.0, active_titlebar_bg = "#333333", inactive_titlebar_bg = "#333333" }

-- Keybindings
config.keys = {
	-- Launcher
	{ key = "l", mods = "ALT", action = wezterm.action.ShowLauncher },

	-- Pane navigation
	{ key = "}", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Next" }) },
	{ key = "{", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Prev" }) },

	-- Pane splitting
	{ key = "H", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "V", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- TODO: add zoom in/out pane
	-- workspaces
	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }) },
}

wezterm.on("gui-startup", function()
	local mux = wezterm.mux

	-- Create a new workspace called "dev"
	local _, pane, window = mux.spawn_window({
		workspace = "stanley-us",
		cwd = "/Users/adam.jensen/stanley/stanley-shopify-live-us",
	})

	-- First tab: split into two panes
	pane:split({
		direction = "Right",
		cwd = "/Users/adam.jensen/stanley/stanley-shopify-live-us",
	})

	-- Second tab: open in another directory
	local _, _, _ = window:spawn_tab({
		cwd = "/Users/adam.jensen/stanley/stanley-shopify-live-us/",
	})

	-- Finally, switch to this workspace
	mux.set_active_workspace("stanley-us")
end)

wezterm.on("format-tab-title", function(tab)
	local process_name = tab.active_pane.foreground_process_name
	if process_name then
		process_name = process_name:gsub("(.*[/\\])", "") -- strip path
	else
		process_name = "?"
	end

	local cwd_uri = tab.active_pane.current_working_dir
	local cwd = "?"
	if cwd_uri then
		cwd = cwd_uri.file_path or cwd_uri
		cwd = cwd:gsub(".*[/\\]", "") -- just last folder
	end

	local title = string.format("  [%s]  : %s  ", cwd, process_name)

	if tab.is_active then
		-- Highlight active tab: bold
		return wezterm.format({
			{ Attribute = { Intensity = "Bold" } },
			{ Text = title },
		})
	else
		-- Dim inactive tabs
		return wezterm.format({
			{ Foreground = { Color = "gray" } },
			{ Text = title },
		})
	end
end)

-- Return the final configuration
return config
