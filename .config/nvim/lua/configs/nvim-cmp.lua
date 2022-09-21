-- hrsh7th/nvim-cmp

local line_ok, cmp = pcall(require, "cmp")

if not line_ok then
	return
end

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	cmp.setup({
		mapping = cmp.mapping.preset.insert({
			['q'] = cmp.mapping.abort(),
			['<C-l>'] = cmp.mapping.confirm(),
			['<C-j>'] = cmp.mapping.select_next_item(),
			['<C-k>'] = cmp.mapping.select_prev_item(),
			['<C-n>'] = cmp.mapping.scroll_docs(4),
			['<C-p>'] = cmp.mapping.scroll_docs(-4),
		}),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
	}, {
		{ name = 'buffer' },
	})
})
