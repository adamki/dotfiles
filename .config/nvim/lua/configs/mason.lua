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
mason.setup()

-- ensure LSP servers are installed
mason_lspconfig.setup({
    ensure_installed = {
        "vtsls",
        "lua_ls",
    },
    automatic_installation = true,
})

-- ensure CLI tools/formatters are installed
mason_tool_installer.setup({
    ensure_installed = {
        "eslint_d",
        "prettier",
        "stylua",
        "shellcheck",
        "shfmt",
    },
})
