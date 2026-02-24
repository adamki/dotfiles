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
	local project_dir = "/Users/adam.jensen/workspace"

	-- Create a new workspace called "development"
	local _, pane, window = mux.spawn_window({
		workspace = "development",
		cwd = project_dir,
	})

	-- First split: divide horizontally to create top and bottom sections
	local bottom_pane = pane:split({
		direction = "Bottom",
		size = 0.5,
		cwd = project_dir,
	})

	-- Second split: divide the bottom section into left and middle
	local middle_pane = bottom_pane:split({
		direction = "Right",
		size = 0.66, -- This creates roughly 1/3 of the bottom space
		cwd = project_dir,
	})

	-- Third split: divide the remaining bottom section to create the rightmost pane
	middle_pane:split({
		direction = "Right",
		size = 0.5, -- Split the remaining 2/3 in half
		cwd = project_dir,
	})

	-- Finally, switch to this workspace
	mux.set_active_workspace("development")
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
		local full_path = cwd_uri.file_path or cwd_uri
		-- Extract last two directories
		local parts = {}
		for part in full_path:gmatch("[^/\\]+") do
			table.insert(parts, part)
		end

		if #parts >= 2 then
			cwd = parts[#parts - 1] .. "/" .. parts[#parts]
		elseif #parts == 1 then
			cwd = parts[1]
		else
			cwd = "/"
		end
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
