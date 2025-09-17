-- lua/configs/blink-cmp.lua
local line_ok, aerial = pcall(require, "aerial")

if not line_ok then
    return
end

local opts = {
    attach_mode = "global",
    backends = { "lsp", "treesitter", "markdown", "man" },
    show_guides = true,
    layout = {
        resize_to_content = false,
        win_opts = {
            winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
            signcolumn = "yes",
            statuscolumn = " ",
        },
    },
    -- stylua: ignore
    guides = {
        mid_item   = "├╴",
        last_item  = "└╴",
        nested_top = "│ ",
        whitespace = "  ",
    },
}

aerial.setup(opts)
