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

    vim.keymap.set("n", "gd", function()
        vscode.action("editor.action.revealDefinition")
    end)

    -- gr: open references panel
    vim.keymap.set("n", "gr", function()
        vscode.action("editor.action.goToReferences")
    end)

    vim.keymap.set("n", "=", function()
        vscode.action("editor.action.formatDocument")
    end)

    vim.keymap.set("n", "<leader>w", function()
        vscode.action("workbench.action.files.save")
    end)

    vim.keymap.set("n", "<leader>q", function()
        vscode.action("workbench.action.closeActiveEditor")
    end)
    -- <leader>x: save and close tab
    vim.keymap.set("n", "<leader>x", function()
        vscode.action("workbench.action.files.save")
        vscode.action("workbench.action.closeActiveEditor")
    end)
else
    require("settings")
    require("configs.lazy")
    require("post-plugin-install-settings")
    require("mappings")
    require("filetypes")
    require("autocommands")
end
