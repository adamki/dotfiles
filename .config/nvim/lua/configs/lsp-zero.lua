local line_ok, lsp = pcall(require, "lsp-zero")

if not line_ok then
	return
end

lsp.preset('recommended')
lsp.set_preferences({ set_lsp_keymaps = false })
lsp.nvim_workspace()
lsp.on_attach(function(_, bufnr)
	local noremap = {buffer = bufnr, remap = false}
	local set = vim.keymap.set

	set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', noremap)
	set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', noremap)
	set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', noremap)
	set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', noremap)
	set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', noremap)
	set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', noremap)
	set('n', 'gK', '<cmd>lua vim.lsp.buf.signature_help()<cr>', noremap)
	set('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<cr>', noremap)
	set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', noremap)
	set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', noremap)
	set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', noremap)
	set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', noremap)
end)

lsp.setup()
