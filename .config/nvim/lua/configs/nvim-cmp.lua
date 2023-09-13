-- hrsh7th/nvim-cmp

local line_ok, cmp = pcall(require, "cmp")

if not line_ok then
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  view = {
    entries = {name = 'custom', selection_order = 'near_cursor' }
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-c>'] = cmp.mapping.abort(),
    ['<C-l>'] = cmp.mapping.confirm(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),

    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),

    ['<Down>'] = cmp.mapping.scroll_docs(4),
    ['<Up>'] = cmp.mapping.scroll_docs(-4),
  }),
  sources = cmp.config.sources({
    { name = 'luasnip' }, -- For luasnip users.
  }, {
      { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
      { name = 'cmdline' }
    })
})

-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--   capabilities = capabilities
-- }
