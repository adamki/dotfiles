-- feline-nvim/feline.nvim

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
	grey = "#404c51",
	light_grey = "#68757d",
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

local display_wide = function()
	return vim.api.nvim_win_get_width(0) > 80
end
local display_narrow = function()
	return vim.api.nvim_win_get_width(0) < 80
end


local c = {
	blank = {
		bg = "bg",
	},
	separator = {
		provider = "  " ,
		hl = { bg = "grey" },
	},
	filetype = {
		provider = "file_type",
		hl = { bg = "grey" },
		enabled = display_wide,
	},
	gitBranch = {
		provider = "git_branch",
		hl = { fg = "fg", bg = "grey" },
		left_sep = "block",
		right_sep = "block",
		enabled = display_wide,
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = { fg = "green", bg = "grey" },
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = { fg = "red", bg = "grey" },
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		hl = { fg = "yellow", bg = "grey" },
	},
	fileinfo_base_full = {
		provider = {
			name = "file_info",
			opts = {
				type = "relative",
			},
		},
		hl = {
			fg = "bg",
			bg = "orange",
		},
		left_sep = "block",
		right_sep = "block",
		icon = {
			str = '',
		},
		short_provider = {
			name = "file_info",
			opts = {
				type = "relative-short"
			}
		}
	},
	fileinfo_full = {
		provider = {
			name = "file_info",
			opts = {
				type = "relative"
			}
		},
		hl = {
			fg = "light_grey",
			bg = "bg",
		},
		icon = {
			str = '',
		},
		short_provider = {
			name = "file_info",
			opts = {
				type = "relative-short"
			}
		}
	},
	diagnostic_errors = {
		provider = "diagnostic_errors",
		hl = { fg = "red", bg = "grey" },
		enabled = display_wide,
	},
	diagnostic_warnings = {
		provider = "diagnostic_warnings",
		hl = { fg = "orange", bg = "grey" },
		enabled = display_wide,
	},
	diagnostic_info = {
		provider = "diagnostic_info",
		hl = { fg = "yellow", bg = "grey" },
		enabled = display_wide,
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
		hl = { fg = "green", bg = "grey" },
		enabled = display_wide,
	},
	lsp_client_names = {
		provider = "lsp_client_names",
		hl = { fg = "purple", bg = "grey" },
		enabled = display_wide,
	},
	position = {
		provider = "position",
		hl = { fg = "fg", bg = "grey" },
		enabled = display_wide,
	},
}

local left = {
	c.gitBranch,
	c.gitDiffAdded,
  c.gitDiffRemoved,
	c.gitDiffChanged,
	c.separator,
	c.blank,
}

local middle = {
	c.fileinfo_base_full,
}

local right = {
	c.diagnostic_hints,
	c.diagnostic_info,
	c.diagnostic_warnings,
	c.diagnostic_errors,
	c.separator,
	c.filetype,
	c.separator,
	c.lsp_client_names,
}

local inactive_middle = {
	c.fileinfo_full,
}

local components = {
	active = {
		left,
		middle,
		right,
	},
	inactive = {
		inactive_middle,
	},
}

local theme = everforest

feline.setup({
	components = components,
	theme = theme,
	vi_mode_colors = vi_mode_colors,
	force_inactive = {
		filetypes = {
			"checkhealth",
			"NvimTree",
			"Outline",
			"packer",
			"help",
		},
		buftypes = { "terminal" },
		bufnames = {},
	},
})

