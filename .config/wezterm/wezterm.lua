-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

-- Create a new configuration object
local config = wezterm.config_builder()

-- Color scheme
config.adjust_window_size_when_changing_font_size = false
-- light >> dark: latte, frappe, macchiato, mocha
config.color_scheme = "catppuccin-mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono", {
	weight = "Medium",
})
config.font_size = 16
config.harfbuzz_features = {
	"calt=0",
	"clig=0",
	"liga=0",
}

-- config.initial_cols = 120
-- config.initial_rows = 28
config.native_macos_fullscreen_mode = true
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

	-- Pane focus/Zoom
	{
		key = "UpArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "b",
		mods = "CTRL|SHIFT",
		action = act.RotatePanes("CounterClockwise"),
	},
	{ key = "n", mods = "CTRL|SHIFT", action = act.RotatePanes("Clockwise") },
	-- splitting
	-- This will create a new split and run your default program inside it
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- This will create a new split and run your default program inside it
	{
		key = "_",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

wezterm.on("format-tab-title", function(tab)
	local pane = tab.active_pane

	-- Working directory: always computed first so it leads the title and
	-- survives truncation even when many tabs are open.
	local cwd = "?"
	local full_path = nil
	local cwd_uri = pane.current_working_dir
	if cwd_uri then
		full_path = cwd_uri.file_path or tostring(cwd_uri)
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

	local process_name = pane.foreground_process_name
	if process_name and process_name ~= "" then
		process_name = process_name:gsub("(.*[/\\])", "") -- strip path
	else
		process_name = "?"
	end

	-- Claude Code runs as `node` and sets a descriptive OSC title. Prefer that
	-- live task description over the bare process name so Claude tabs are
	-- distinguishable. Strip Claude's leading spinner glyph (e.g. "⠐ ").
	local descriptor = process_name
	if process_name == "claude" or process_name == "node" then
		local pane_title = pane.title or ""
		local cleaned = pane_title:gsub("^[^%a]*", "")
		if cleaned ~= "" then
			descriptor = cleaned
		end
	end

	-- Guard the git call: a failure here must never blank the title and force
	-- WezTerm to fall back to the raw (dir-less) pane title.
	local branch = ""
	if full_path and full_path:sub(1, 1) == "/" then
		local pok, succeeded, stdout =
			pcall(wezterm.run_child_process, { "git", "-C", full_path, "rev-parse", "--abbrev-ref", "HEAD" })
		if pok and succeeded and type(stdout) == "string" then
			branch = stdout:gsub("%s+$", "")
		end
	end

	local title
	if branch ~= "" then
		title = string.format("  [%s] (%s)  : %s  ", cwd, branch, descriptor)
	else
		title = string.format("  [%s]  : %s  ", cwd, descriptor)
	end

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

wezterm.on("gui-startup", function()
	local project_dir = wezterm.home_dir .. "/workspace/kairos"

	-- Start a window in the desired dir
	local tab, pane, window = mux.spawn_window({
		workspace = "kairos",
		cwd = project_dir,
	})

	-- Layout: 2 top, 2 bottom (grid 2x2)
	-- Start with one pane, split vertically to get top/bottom
	local bottom = pane:split({
		direction = "Bottom",
		size = 0.5,
		cwd = project_dir,
	})

	-- Split the top horizontally into left/right
	local top_right = pane:split({
		direction = "Right",
		size = 0.5,
		cwd = project_dir,
	})

	-- Split the bottom horizontally into left/right
	local bottom_right = bottom:split({
		direction = "Right",
		size = 0.5,
		cwd = project_dir,
	})

	-- mux.set_active_workspace("kairos")
end)

-- Return the final configuration
return config
