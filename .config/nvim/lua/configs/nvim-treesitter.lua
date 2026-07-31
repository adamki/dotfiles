-- nvim-treesitter/nvim-treesitter (main branch, Neovim 0.12+ API)

local ok, ts = pcall(require, "nvim-treesitter")

if not ok then
	return
end

-- Install parsers (async). `:TSUpdate` (lazy build step) keeps them current.
ts.install({
	"bash",
	"glimmer_javascript",
	"html",
	"javascript",
	"json",
	"liquid",
	"lua",
	"ruby",
	"python",
	"typescript",
	"vim",
	"yaml",
})

-- Highlighting is provided by Neovim core; start it per-buffer only when a parser
-- is available. This also no-ops cleanly on parserless buffers (no error).
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
	callback = function(args)
		local buf = args.buf
		local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype) or vim.bo[buf].filetype
		if pcall(vim.treesitter.start, buf, lang) then
			-- experimental treesitter-based indentation
			vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})
