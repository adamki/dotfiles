local ft_group = vim.api.nvim_create_augroup('filetype_group', { clear = false })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "vim",
	group = ft_group,
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.noexpandtab = true
    vim.opt_local.tabstop = 2
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
	group = ft_group,
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
  end

})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
	group = ft_group,
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
	group = ft_group,
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end
})