-- lua/configs/blink-cmp.lua

local line_ok, aerial = pcall(require, "aerial")

if not line_ok then
	return
end

local opts = {
	attach_mode = "global",
	backends = {  "treesitter", "lsp", "markdown", "man" },
	show_guides = true,
	layout = {
		resize_to_content = false,
		win_opts = {
			winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
			signcolumn = "yes",
			statuscolumn = " ",
		},
	},
    filter_kind = {
        "Class",
        "Function",
        "Variable",
        "Method",
        "Property",
        "Constant",
        "Interface",
        "Enum",
        "Module",
    },
    -- stylua: ignore
    guides = {
        mid_item   = "├╴",
        last_item  = "└╴",
        nested_top = "│ ",
        whitespace = "  ",
    },
	on_attach = function(bufnr)
		local set = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, remap = false, desc = desc })
		end

		set("n", "<leader>a", "<cmd>AerialToggle!<CR>", "Aerial Toggle")
	end,
}

aerial.setup(opts)
