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
	grey = "#404c51"
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
	blank = {
		bg = "grey"
	},
	separator = {
		provider = "  ",
	},
	gitBranch = {
		provider = "git_branch",
		hl = {
			fg = "yellow",
		},
		enabled = function ()
			return vim.api.nvim_win_get_width(0) > 80
		end,
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = {
			fg = "green",
		},
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = {
			fg = "red",
		},
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		hl = {
			fg = "fg",
		},
	},
	fileinfo_base = {
		provider = {
			name = "file_info",
			opts = {
				type = "base-only",
			},
		},
		hl = {
			fg = "bg",
			bg = "orange",
		},
		left_sep = "left_rounded",
		right_sep = "right_rounded",
		icon = {
			str = '',
		},
	},
	fileinfo_full = {
		provider = {
			name = "file_info",
			opts = {
				type = "relative"
			}
		},
		hl = {
			fg = "grey",
			bg = "bg",
		},
		icon = {
			str = '',
		},
		enabled = function()
			return vim.api.nvim_win_get_width(0) > 80
		end
	},
	fileinfo_short = {
		provider = {
			name = "file_info",
			opts = {
				type = "relative-short"
			}
		},
		hl = {
			fg = "grey",
			bg = "bg",
		},
		icon = {
			str = '',
		},
		enabled = function()
			return vim.api.nvim_win_get_width(0) < 80
		end
	},
	diagnostic_errors = {
		provider = "diagnostic_errors",
		hl = {
			fg = "red",
		},
		right_sep = "right_rounded"
	},
	diagnostic_warnings = {
		provider = "diagnostic_warnings",
		hl = {
			fg = "orange",
		},
	},
	diagnostic_info = {
		provider = "diagnostic_info",
		hl = {
			fg = "yellow",
		},
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
		hl = {
			fg = "aqua",
		},
	},
	lsp_client_names = {
		provider = "lsp_client_names",
		hl = {
			fg = "purple",
		},
		enabled = function ()
			return vim.api.nvim_win_get_width(0) > 80
		end,
	},
	position = {
		provider = "position",
		hl = {
			fg = "fg",
			bg = "bg",
		},
		enabled = function ()
			return vim.api.nvim_win_get_width(0) > 80
		end,
	},
}

local left = {
	c.gitBranch,
	c.gitDiffAdded,
  c.gitDiffRemoved,
	c.gitDiffChanged,
	c.separator,
	c.fileinfo_base,
}

local middle = {
}

local right = {
	c.diagnostic_hints,
	c.diagnostic_info,
	c.diagnostic_warnings,
	c.diagnostic_errors,
	c.separator,
	c.lsp_client_names,
	c.separator,
	c.position,
}

local inactive_middle = {
	c.fileinfo_full,
	c.fileinfo_short,
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

