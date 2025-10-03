local line_ok, indent = pcall(require, "ibl")

if not line_ok then
    return
end

local highlight = { "CursorColumn", "Whitespace" }

indent.setup({
    indent = { highlight = highlight, char = "" },
    whitespace = { highlight = highlight, remove_blankline_trail = false },
    scope = { enabled = true },
})
