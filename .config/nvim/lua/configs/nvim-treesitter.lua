-- nvim-treesitter/nvim-treesitter

local line_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not line_ok then
    return
end

treesitter.setup {
    ensure_installed = { -- A list of parser names, or "all"
        "bash",
        "html",
        "javascript",
        "json",
        "typescript",
        "python",
        "vim"
    },
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = true
    },
    indent = {
        enable = true
    },
    autotag = {
        enable = true,
        filetypes = {
            'html',
            'javascript',
            'typescript',
            'javascriptreact',
            'typescriptreact',
            'svelte',
            'vue',
            'tsx',
            'jsx',
            'css',
            'lua',
            'xml',
            'php',
            'markdown'
        },
    },
}

