local ok, conform = pcall(require, "conform")

if not ok then
    return
end

local opts = {
    -- this just tells conform what formatter to use, it does not install them. Use :Mason to install
    formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        css = { "prettier" },
        -- html = { "prettier" },
        -- json = { "prettier" },
        -- yaml = { "prettier" },
        -- markdown = { "prettier" },
        python = { "autopep8" },
        lua = { "stylua" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        ruby = { "rubocop" },
    },
    formatters = {
        shfmt = {
            -- 2-space indent for sh/bash/zsh; -bn = binary ops on next line
            prepend_args = { "-i", "2", "-bn" },
        },
        rubocop = {
            command = "bundle",
            prepend_args = { "exec", "rubocop", "--server" },
        },
    },

    format_on_save = {
        lsp_format = "never",
        async = false,
        timeout_ms = 10000,
    },
}

conform.setup(opts)

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    conform.format({
        lsp_format = "fallback",
        async = false,
        timeout_ms = 10000,
    })
end, { desc = "Format file or range (in visual mode)" })
