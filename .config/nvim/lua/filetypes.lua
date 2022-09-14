local o = vim.o
local wo = vim.wo

vim.api.nvim_create_autocmd("FileType", {
  pattern = "vim",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.noexpandtab = true
    vim.opt_local.tabstop = 2
  end
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "python",
--   callback = function()
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.softtabstop = 4
--     vim.opt_local.expandtab = true
--     vim.opt_local.tabstop = 4
--   end
--
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end
})
