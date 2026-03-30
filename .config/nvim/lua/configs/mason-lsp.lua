local m_ok, mason = pcall(require, "mason")
if not m_ok then
    return
end

local ml_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ml_ok then
    return
end

local mti_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
if not mti_ok then
    return
end

-- mason setup
mason.setup({
    ui = {
        border = "rounded", -- "none", "single", "double", "rounded", "solid", "shadow"
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

-- ensure LSP servers are installed (gem-based servers need a default Ruby, e.g. `asdf set -u ruby <ver>`)
mason_lspconfig.setup({
    ensure_installed = {
        "jedi_language_server",
        "vtsls",
        "lua_ls",
        "rust_analyzer",
        "ruby_lsp",
    },
    automatic_installation = true,
})

-- These are installed in Mason as tools, not LSP servers; prevent automatic_enable from starting them
vim.lsp.enable("solargraph", false)
vim.lsp.enable("rubocop", false)

-- ruby-lsp: disable diagnostics and formatting (nvim-lint and conform handle those)
vim.lsp.config("ruby_lsp", {
    init_options = {
        linters = {},
        formatter = "none",
        enabledFeatures = {
            diagnostics = false,
            formatting = false,
        },
    },
})

-- ensure CLI tools/formatters are installed
mason_tool_installer.setup({
    ensure_installed = {
        "flake8",
        "autopep8",
        "eslint_d",
        "prettier",
        "stylua",
        "shellcheck",
        "shfmt",
        "rubocop",
    },
})
