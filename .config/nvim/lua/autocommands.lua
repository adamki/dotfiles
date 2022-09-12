local augroup = vim.api.nvim_create_augroup('highlight_cmds', {clear = true})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  group = augroup,
  command = [[%s/\s\+$//e]], -- strip whitespace
})

vim.api.nvim_create_autocmd("BufRead", {
  group = augroup,
  pattern = "*",
  command = [[call setpos(".", getpos("'\""))]] -- return cursor to prev pos
})
