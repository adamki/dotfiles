local line_ok, lsp = pcall(require, "lsp-zero")

if not line_ok then
  return
end

lsp.preset('recommended')
lsp.set_preferences({ set_lsp_keymaps = false })
lsp.nvim_workspace()
lsp.on_attach(LspZeroKeys)

lsp.setup()
