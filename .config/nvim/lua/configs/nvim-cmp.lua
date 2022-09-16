-- hrsh7th/nvim-cmp

local cmp = require'cmp'

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['q'] = cmp.mapping.abort(),
		['<C-l>'] = cmp.mapping.confirm(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.scroll_docs(4),
		['<C-p>'] = cmp.mapping.scroll_docs(-4),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
	}, {
		{ name = 'buffer' },
	})
})
