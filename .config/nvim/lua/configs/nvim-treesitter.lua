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
        "python",
        "typescript",
        "vim",
        "lua"
    },
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = true
    },
    indent = {
        enable = true
    },
    autotag = { -- nvim-ts-autotags config
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = {
            'css',
            'html',
            'javascript',
            'javascriptreact',
            'jsx',
            'lua',
            'markdown',
            'php',
            'svelte',
            'tsx',
            'typescript',
            'typescriptreact',
            'vue',
            'xml',
        },
    },
}
