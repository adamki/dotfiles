-- nvim-treesitter/nvim-treesitter

local line_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not line_ok then
    return
end

treesitter.setup {
    ensure_installed = { -- A list of parser names, or "all"
        "bash",
        "glimmer_javascript",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "typescript",
        "vim",
        "yaml"
    },
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = true
    },
    indent = {
        enable = true
    },
}
