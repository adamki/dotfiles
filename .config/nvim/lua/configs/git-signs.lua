-- lewis6991/gitsigns

local ok, gs = pcall(require, "gitsigns")

if not ok then
    return
end

gs.setup({
    preview_config = {
        border = 'rounded',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    on_attach = function(bufnr)
        local set = function(mode, lhs, rhs, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Gitsigns jump
        set("n", "]c", function() gs.next_hunk() end, { desc = "GitSigns next_hunk" })
        set("n", "[c", function() gs.prev_hunk() end, { desc = "GitSigns prev_hunk" })

        -- reset
        set("n", "<leader>hR", function() gs.reset_buffer() end, { desc = "GitSigns reset_buffer" })
        set("n", "<leader>hr", function() gs.reset_hunk() end, { desc = "GitSigns reset_hunk" })
        set("v", "<leader>hr", function()
            local start_line = vim.fn.line("v")
            local end_line = vim.fn.line(".")
            gs.reset_hunk({ math.min(start_line, end_line), math.max(start_line, end_line) })
        end, { desc = "GitSigns reset_hunk" })

        -- previews/blames
        set("n", "<leader>hp", function() gs.preview_hunk() end, { desc = "GitSigns preview_hunk" })
        set("n", "<leader>hH", function() gs.preview_hunk_inline() end, { desc = "GitSigns preview_hunk_inline" })
        set("n", "<leader>hd", function() gs.diffthis() end, { desc = "GitSigns vdiff buffer" })
        set("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "GitSigns blame_line" })

        -- stage
        set("n", "<leader>hs", function() gs.stage_hunk() end, { desc = "GitSigns stage_hunk" })
        set("v", "<leader>hs", function()
            local start_line = vim.fn.line("v")
            local end_line = vim.fn.line(".")
            gs.stage_hunk({ math.min(start_line, end_line), math.max(start_line, end_line) })
        end, { desc = "GitSigns stage visual selection" })
        set("n", "<leader>hu", function() gs.undo_stage_hunk() end, { desc = "GitSigns undo_stage_hunk" })
    end,
})
