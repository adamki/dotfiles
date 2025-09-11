-- lua/configs/blink-cmp.lua
local line_ok, blink = pcall(require, "blink.cmp")

if not line_ok then
    return
end

-- Main configuration table
local opts = {
    keymap = {
        preset = "default",
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-l>'] = { 'accept', 'fallback' },
    },

    completion = {
        documentation = {
            auto_show = false,
            auto_show_delay_ms = 250,
            treesitter_highlighting = true,
            window = { border = "rounded" },
        },
        ghost_text = { enabled = true },
        menu = {
            border = "rounded",
            draw = {
                treesitter = { "lsp" },
                columns = {
                    { "label", "label_description", gap = 1 },
                    { "kind_icon", "kind", "source_name", gap = 1 },
                },
            },
        },
    },

    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
            buffer = {
                opts = {
                    get_bufnrs = function()
                        return vim.api.nvim_list_bufs()
                    end,
                }
            },
        },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true },
}

-- Apply the configuration
blink.setup(opts)
