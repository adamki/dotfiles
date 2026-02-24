if vim.g.vscode then
    local vscode = require("vscode")

    local keymap = vim.keymap.set
    local opts = {
        noremap = true,
        silent = true,
    }

    -- remap leader key
    vim.g.mapleader = " "
    vim.g.maplocalleader = ","

    keymap("n", "<LocalLeader>f", function()
        vim.fn.VSCodeNotify("workbench.action.quickOpen")
    end, opts)

    keymap("n", "<LocalLeader>g", function()
        vim.fn.VSCodeNotify("workbench.view.search")
    end, opts)
else
    require("settings")
    require("configs.lazy")
    require("post-plugin-install-settings")
    require("mappings")
    require("filetypes")
    require("autocommands")
end
