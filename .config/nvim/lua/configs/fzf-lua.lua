local ok, fzf = pcall(require, "fzf-lua")

if not ok then
	return
end

local fzf_cmd = os.getenv("FZF_DEFAULT_COMMAND")
if not fzf_cmd or not fzf_cmd:match("^rg ") then
	fzf_cmd = "rg --files"
end

-- default ignored globs (you can still override)
local default_file_globs = {
	"!assets/**/*.min.js.LICENSE.txt",
	"!assets/**/*.min.js.map",
	"!assets/**/*.min.js",
	"!node_modules/**",
}

-- globs to ignore for grep
local grep_ignore_globs = {
	"!assets/**/*.min.js.LICENSE.txt",
	"!assets/**/*.min.js.map",
	"!assets/**/*.min.js",
	"!node_modules/**",
}

-- helper to turn table into --glob args
local function make_globs(globs)
	local parts = {}
	for _, g in ipairs(globs) do
		table.insert(parts, "--glob '" .. g .. "'")
	end
	return table.concat(parts, " ")
end

fzf.setup({
	"telescope",
	fzf_opts = {
		["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-history", -- path to store history
	},
	winopts = {
		preview = {
			default = "bat",
			title = true,
			border = "rounded",
		},
	},
	files = {
		cmd = fzf_cmd .. " " .. make_globs(default_file_globs),
		cwd_prompt = true,
		history = 100,
	},
	grep = {
		rg_opts = "--no-binary " .. make_globs(grep_ignore_globs),
		cwd_prompt = true,
		silent = true,
		history = 100,
	},
	previewers = {
		cmd = "bat",
	},
})

-- =============[ Keymaps ]=============
local set = vim.keymap.set
local fzf_lua = require("fzf-lua")

-- Custom grep multiple subdirs picker
set("n", "<LocalLeader>G", function()
	local root = require("fzf-lua.path").git_root({}) or vim.fn.getcwd()
	local subdirs = vim.fn.glob(root .. "/*", 1, 1)
	subdirs = vim.tbl_filter(function(p)
		return vim.fn.isdirectory(p) == 1
	end, subdirs)

	fzf_lua.fzf_exec(subdirs, {
		prompt = "Use TAB to pick subdirs > ",
		fzf_opts = { ["--multi"] = true },
		actions = {
			["default"] = function(selected)
				if not selected or vim.tbl_isempty(selected) then
					return
				end
				fzf_lua.live_grep({ cwd = root, search_dirs = selected })
			end,
		},
	})
end, { desc = "FzfLua grep multi dirs" })

-- Standard mappings
set("n", "<LocalLeader>,", ":FzfLua<CR>", { desc = "FzfLua main menu" })
set("n", "<LocalLeader>f", ":FzfLua files<CR>", { desc = "FzfLua files" })
set("n", "<LocalLeader>g", ":FzfLua grep_project<CR>", { desc = "FzfLua grep project" })
set("n", "<LocalLeader><BS>", ":FzfLua grep_cword<CR>", { desc = "FzfLua cursor word" })
set("n", "<LocalLeader>b", ":FzfLua buffers<CR>", { desc = "FzfLua buffers" })
set("n", "<LocalLeader>j", ":FzfLua jumps<CR>", { desc = "FzfLua jump locations" })
set("n", "<LocalLeader>h", ":FzfLua help_tags<CR>", { desc = "FzfLua help_tags" })
set("n", "<LocalLeader>l", ":FzfLua blines<CR>", { desc = "FzfLua blines" })
set("n", "<LocalLeader>m", ":FzfLua marks<CR>", { desc = "FzfLua marks" })
set("n", "<LocalLeader>t", ":FzfLua tabs<CR>", { desc = "FzfLua tabs" })
set("n", "<localleader>?", ":FzfLua keymaps<CR>", { desc = "FzfLua keymaps" })
set("n", "<localleader>s", ":FzfLua colorschemes<CR>", { desc = "FzfLua colorschemes" })
set("n", "<localleader>/", ":FzfLua search_history<CR>", { desc = "FzfLua search_history" })
set("n", "<localleader>r", ":FzfLua command_history<CR>", { desc = "FzfLua command_history" })
set("n", "<localleader>y", ":FzfLua oldfiles<CR>", { desc = "FzfLua old_files" })
set("n", "<localleader>C", ":FzfLua git_bcommits<CR>", { desc = "FzfLua git_bcommits" })
set("n", "<localleader>c", ":FzfLua git_commits<CR>", { desc = "FzfLua git_commits" })
