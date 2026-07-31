-- Pull in the wezterm API
local wezterm = require("wezterm")
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
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.4,
}
config.harfbuzz_features = {
	"calt=0",
	"clig=0",
	"liga=0",
}

config.native_macos_fullscreen_mode = true
config.tab_max_width = 100
config.window_frame = { font_size = 14.0, active_titlebar_bg = "#333333", inactive_titlebar_bg = "#333333" }

-- Keybindings
config.keys = {
	-- Launcher
	{ key = "l", mods = "ALT", action = act.ShowLauncher },

	-- tab ordering
	{ key = "{", mods = "CTRL|SHIFT", action = act.MoveTabRelative(-1) },
	{ key = "}", mods = "CTRL|SHIFT", action = act.MoveTabRelative(1) },

	-- Pane focus/Zoom
	{ key = "Z", mods = "CTRL|SHIFT", action = act.TogglePaneZoomState },
	{ key = "b", mods = "CTRL|SHIFT", action = act.RotatePanes("CounterClockwise") },
	{ key = "n", mods = "CTRL|SHIFT", action = act.RotatePanes("Clockwise") },

	-- Pane navigation
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
	{ key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = true }) },

	-- Splitting
	{ key = "|", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "_", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
}

-- Cache git branch lookups: format-tab-title fires often and a synchronous
-- child process on every call causes UI stutter. Refresh at most every 5s.
local branch_cache = {}

local function git_branch(path)
	local now = os.time()
	local hit = branch_cache[path]
	if hit and (now - hit.at) < 5 then
		return hit.branch
	end
	local branch = ""
	local pok, succeeded, stdout =
		pcall(wezterm.run_child_process, { "git", "-C", path, "rev-parse", "--abbrev-ref", "HEAD" })
	if pok and succeeded and type(stdout) == "string" then
		branch = stdout:gsub("%s+$", "")
	end
	branch_cache[path] = { branch = branch, at = now }
	return branch
end

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

	local branch = ""
	if full_path and full_path:sub(1, 1) == "/" then
		branch = git_branch(full_path)
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

-- Return the final configuration
return config
