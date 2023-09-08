local generic_augroup = vim.api.nvim_create_augroup('generic_augroup', {clear = true})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  group = generic_augroup,
  command = [[%s/\s\+$//e]], -- strip whitespace
})

vim.api.nvim_create_autocmd("BufRead", {
  group = generic_augroup,
  pattern = "*",
  command = [[call setpos(".", getpos("'\""))]] -- return cursor to prev pos
})


local toggle_augroup = vim.api.nvim_create_augroup('toggle_augroup', {clear = true})
vim.api.nvim_create_autocmd({"BufEnter","FocusGained","InsertLeave","WinEnter"}, {
  group = toggle_augroup,
  pattern = "*",
  callback = function()
    if vim.wo.number and vim.api.nvim_get_mode() ~= "i" then
      vim.wo.relativenumber = true
    end
  end
})

vim.api.nvim_create_autocmd({"BufLeave","FocusLost","InsertEnter","WinLeave"}, {
  group = toggle_augroup,
  pattern = "*",
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = false
    end
  end
})
