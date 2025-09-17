local ok, lint = pcall(require, "lint")

if not ok then
    return
end

-- Main configuration table
lint.linters_by_ft = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    lua = { "luacheck" },
    -- python = { "flake8" },
    sh = { "shellcheck" },
}

-- Create an augroup for linting
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

-- Function to try linting current buffer
local function try_linting()
    local linters = lint.linters_by_ft[vim.bo.filetype]
    lint.try_lint(linters)
end

-- Autocmds to lint on buffer events
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = try_linting,
})

-- Keymap to manually trigger linting
vim.keymap.set("n", "<leader>ml", try_linting, { desc = "Trigger linting for current file" })
