local autocmd = vim.api.nvim_create_autocmd

-- AutoGroups
local generic_augroup = vim.api.nvim_create_augroup("generic_augroup", { clear = true })
local rnu_toggle_augroup = vim.api.nvim_create_augroup("rnu_toggle_augroup", { clear = true })

-- AutoCommands
autocmd("BufWritePre", {
    pattern = "*",
    group = generic_augroup,
    command = [[%s/\s\+$//e]], -- strip whitespace
})

autocmd("BufRead", {
    pattern = "*",
    group = generic_augroup,
    command = [[call setpos(".", getpos("'\""))]], -- return cursor to prev pos
})

autocmd("VimEnter", {
  callback = function()
    if #vim.fn.getqflist() > 0 then
      vim.cmd("copen")
    end
  end
})

function CreateRNUToggleAutocmd()
    autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
        pattern = "*",
        group = rnu_toggle_augroup,
        callback = function()
            if vim.wo.number and vim.api.nvim_get_mode() ~= "i" then
                vim.wo.relativenumber = true
            end
        end,
    })

    autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
        pattern = "*",
        group = rnu_toggle_augroup,
        callback = function()
            if vim.wo.number then
                vim.wo.relativenumber = false
            end
        end,
    })
end

CreateRNUToggleAutocmd()
