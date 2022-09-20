local line_ok, feline = pcall(require, "feline")
if not line_ok then
	return
end

local everforest = {
	fg = "#d3c6aa",
	bg = "#2b3339",
	green = "#a7c080",
	yellow = "#dbbc7f",
	purple = "#d699b6",
	orange = "#e69875",
	red = "#e67e80",
	aqua = "#83c092",
	darkblue = "#7fbbb3",
	grey = "#859289"
}

local vi_mode_colors = {
	NORMAL = "green",
	OP = "green",
	INSERT = "yellow",
	VISUAL = "purple",
	LINES = "orange",
	BLOCK = "darkblue",
	REPLACE = "red",
	COMMAND = "aqua",
}

local c = {
	vim_mode = {
		provider = {
			name = "vi_mode",
			opts = {
				show_mode_name = true,
				-- padding = "center", -- Uncomment for extra padding.
			},
		},
		hl = function()
			return {
				fg = require("feline.providers.vi_mode").get_mode_color(),
				bg = "bg",
				name = "NeovimModeHLColor",
			}
		end,
		left_sep = "block",
		right_sep = "block",
	},
	blank = {
		bg = "grey"
	},
	gitBranch = {
		provider = "git_branch",
		hl = {
			fg = "yellow",
			bg = "grey",
		},
		left_sep = "left_rounded",
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = {
			fg = "green",
			bg = "grey",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = {
			fg = "red",
			bg = "grey",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		hl = {
			fg = "fg",
			bg = "grey",
		},
		left_sep = "block",
		right_sep = "right_rounded",
	},
	separator = {
		provider = "",
	},
	fileinfo = {
		provider = {
			name = "file_info",
			opts = {
				type = "base-only",
			},
		},
		left_sep = " ",
		right_sep = " ",
		icon = {
			str = ' ',
		}
	},
	fileinfo_full = {
		provider = {
			name = "file_info",
			opts = {
				type = "relative"
			}
		},
		icon = {
			str = ' ',
		}
	},
	diagnostic_errors = {
		provider = "diagnostic_errors",
		hl = {
			fg = "red",
			bg = "grey"
		},
	},
	diagnostic_warnings = {
		provider = "diagnostic_warnings",
		hl = {
			fg = "yellow",
			bg = "grey"
		},
	},
	diagnostic_info = {
		provider = "diagnostic_info",
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
		hl = {
			fg = "aqua",
			bg = "grey"
		},
	},
	lsp_client_names = {
		provider = "lsp_client_names",
		hl = {
			fg = "purple",
			bg = "grey",
		},
		left_sep = "left_rounded",
		right_sep = "block"
	},
	file_type = {
		provider = {
			name = "file_type",
			opts = {
				filetype_icon = true,
				case = "titlecase",
			},
		},
		hl = {
			fg = "red",
			bg = "bg",
		},
		left_sep = "block",
		right_sep = "block",
	},
	file_encoding = {
		provider = "file_encoding",
		hl = {
			fg = "orange",
			bg = "bg",
			style = "italic",
		},
		left_sep = "block",
		right_sep = "block",
	},
	position = {
		provider = "position",
		padding = true,
		hl = {
			fg = "green",
			bg = "bg",
		},
		left_sep = "block",
		right_sep = "block",
	},
	line_percentage = {
		provider = "line_percentage",
		hl = {
			fg = "aqua",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "block",
	},
	scroll_bar = {
		provider = "scroll_bar",
		hl = {
			fg = "yellow",
		},
	},
}

local left = {
	c.gitBranch,
	c.gitDiffAdded,
  c.gitDiffRemoved,
	c.gitDiffChanged,
	c.separator,
}

local middle = {
	c.fileinfo,
}

local right = {
	c.position,
	c.lsp_client_names,
	c.diagnostic_hints,
	c.diagnostic_info,
	c.diagnostic_warnings,
	c.diagnostic_errors,
}

local inactive_middle = {
	c.fileinfo_full
}

local inactive_left = {
	c.blank,
}
local inactive_right = inactive_left

local components = {
	active = {
		left,
		middle,
		right,
	},
	inactive = {
		inactive_left,
		inactive_middle,
		inactive_right,
	},
}

local theme = everforest

feline.setup({
	components = components,
	theme = theme,
	vi_mode_colors = vi_mode_colors,
})
