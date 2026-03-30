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

-- Reload buffers when file changed on disk (e.g. by Cursor/agent)
autocmd("FocusGained", {
    pattern = "*",
    group = generic_augroup,
    command = "checktime",
})

autocmd("VimEnter", {
    callback = function()
        if #vim.fn.getqflist() > 0 then
            vim.cmd("copen")
        end
    end,
})

autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
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
