local autocmd = vim.api.nvim_create_autocmd

-- AutoGroups
local generic_augroup = vim.api.nvim_create_augroup('generic_augroup', { clear = true })
local rnu_toggle_augroup = vim.api.nvim_create_augroup('rnu_toggle_augroup', { clear = true })

-- AutoCommands
autocmd("BufWritePre", {
    pattern = "*",
    group = generic_augroup,
    command = [[%s/\s\+$//e]], -- strip whitespace
})

autocmd("BufRead", {
    group = generic_augroup,
    pattern = "*",
    command = [[call setpos(".", getpos("'\""))]] -- return cursor to prev pos
})

function CreateRNUToggleAutocmd()
    autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
        group = rnu_toggle_augroup,
        pattern = "*",
        callback = function()
            if vim.wo.number and vim.api.nvim_get_mode() ~= "i" then
                vim.wo.relativenumber = true
            end
        end
    })

    autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
        group = rnu_toggle_augroup,
        pattern = "*",
        callback = function()
            if vim.wo.number then
                vim.wo.relativenumber = false
            end
        end
    })
end

CreateRNUToggleAutocmd()

