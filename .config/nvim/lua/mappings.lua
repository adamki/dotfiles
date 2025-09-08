local set = vim.keymap.set

-- Basic file operations
set("n", "<Leader>w", ":w<CR>", { remap = false, desc = "Save file" })
set("n", "<Leader>q", ":q<CR>", { remap = false, desc = "Quit file" })
set("n", "<Leader>Q", ":q!<CR>", { remap = false, desc = "Quit without saving" })
set("n", "<Leader>x", ":x<CR>", { remap = false, desc = "Save and quit" })

-- Window management
set("n", "<LocalLeader>z", "<C-W>_<C-W><Bar>", { remap = false, desc = "Maximize current window" })
set("n", "<Up>", ":resize +2<CR>", { remap = false, desc = "Increase window height" })
set("n", "<Down>", ":resize -2<CR>", { remap = false, desc = "Decrease window height" })
set("n", "<Left>", ":vertical resize +2<CR>", { remap = false, desc = "Increase window width" })
set("n", "<Right>", ":vertical resize -2<CR>", { remap = false, desc = "Decrease window width" })
set("n", "<C-J>", "<C-W><C-J>", { remap = false, desc = "Move to window below" })
set("n", "<C-K>", "<C-W><C-K>", { remap = false, desc = "Move to window above" })
set("n", "<C-L>", "<C-W><C-L>", { remap = false, desc = "Move to window right" })
set("n", "<C-H>", "<C-W><C-H>", { remap = false, desc = "Move to window left" })

-- Buffer navigation
set("n", "]b", ":bnext<CR>", { remap = false, desc = "Next buffer" })
set("n", "[b", ":bprev<CR>", { remap = false, desc = "Prev buffer" })

-- Copy file path
set("n", "cp", ":let @+= expand('%') <CR>", { remap = false, desc = "Copy current file path to clipboard" })

-- Interactivesearch/replace
set('n', '<leader>S', function()
    local search = vim.fn.input("Search: ")
    local replace = vim.fn.input("Replace: ")
    vim.cmd("%s/" .. search .. "/" .. replace .. "/gc")
end, { remap = false, desc = "Interactive find & replace in file" })

-- Tabs
set("n", "tq", ":tabclose<CR>", { remap = false, desc = "Close current tab" })
set("n", "tt", ":tabnew<CR>", { remap = false, desc = "Open new tab" })

-- Cursor movement
set("n", "0", "^", { remap = false, desc = "Move to first non-blank character of line" })
set("i", "<C-f>", "<C-x><C-f>", { remap = false, desc = "File completion in insert mode" })

-- Visual mode improvements
set("v", "<", "<gv", { remap = false, desc = "Indent left and stay in visual mode" })
set("v", ">", ">gv", { remap = false, desc = "Indent right and stay in visual mode" })
set("v", "J", ":m '>+1<CR>gv=gv", { remap = false, desc = "Move selection down" })
set("v", "K", ":m '<-2<CR>gv=gv", { remap = false, desc = "Move selection up" })

-- Syntax debugging
set(
    "n",
    "<F3>",
    ":echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '> trans<' . synIDattr(synID(line('.'),col('.'),0),'name') . '> lo<' . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>' . ' FG:' . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'fg#')<CR>",
    { remap = false, desc = "Show syntax group info under cursor" }
)

-- Toggle relative numbers
set("n", "<F2>", function()
    if vim.fn.exists("#rnu_toggle_augroup#BufEnter#*") > 0 then
        vim.wo.relativenumber = false
        vim.api.nvim_command("autocmd! rnu_toggle_augroup")
    else
        vim.wo.relativenumber = true
        CreateRNUToggleAutocmd()
    end
end, { remap = false, desc = "Toggle relative line numbers" })

-- NvimTree & Aerial
set("n", "-", ":NvimTreeFindFileToggle<CR>", { remap = false, desc = "Toggle NvimTree" })
set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { remap = false, desc = "Toggle Aerial outline" })

-- Gitsigns
set("n", "]c", "<cmd>lua require('gitsigns').next_hunk()<CR>", { remap = false, desc = "Next Git hunk" })
set("n", "[c", "<cmd>lua require('gitsigns').prev_hunk()<CR>", { remap = false, desc = "Previous Git hunk" })
set("n", "<leader>hr", "<cmd>lua require('gitsigns').reset_hunk()<CR>", { desc = "Reset current hunk" })
set("v", "<leader>hr", ":lua require('gitsigns').reset_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>", { desc = "Reset selected hunk" })
set("n", "<leader>hR", "<cmd>lua require('gitsigns').reset_buffer()<CR>", { desc = "Reset entire buffer" })
set("n", "<leader>hp", "<cmd>lua require('gitsigns').preview_hunk()<CR>", { desc = "Preview current hunk" })
set("n", "<leader>hb", "<cmd>lua require('gitsigns').blame_line({full=true})<CR>", { desc = "Blame current line" })
set("n", "<leader>hd", "<cmd>lua require('gitsigns').diffthis()<CR>", { desc = "Show diff of current buffer" })
set("n", "<leader>hD", "<cmd>lua require('gitsigns').diffthis('~')<CR>", { desc = "Show diff against staged" })
set("n", "<leader>td", "<cmd>lua require('gitsigns').toggle_deleted()<CR>", { desc = "Toggle deleted lines" })
set("n", "<leader>hs", "<cmd>lua require('gitsigns').stage_hunk()<CR>", { desc = "Stage current hunk" })
set("v", "<leader>hs", ":lua require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>", { desc = "Stage selected hunk" })
set("n", "<leader>hu", "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>", { desc = "Undo stage current hunk" })


-- FzfLua
set("n", "<LocalLeader>,", ":FzfLua", { remap = false, desc = "Open FzfLua main menu" })
set("n", "<LocalLeader>f", "<cmd>lua require('fzf-lua').files()<CR>", { remap = false, desc = "Find files in project" })
set("n", "<LocalLeader>G", function()
    local root = require("fzf-lua.path").git_root({}) or vim.fn.getcwd()
    local subdirs = vim.fn.glob(root .. "/*", 1, 1)
    subdirs = vim.tbl_filter(function(p) return vim.fn.isdirectory(p) == 1 end, subdirs)

    require("fzf-lua").fzf_exec(subdirs, {
        prompt = "Use TAB to pick subdirs > ",
        fzf_opts = { ["--multi"] = true },
        actions = {
            ["default"] = function(selected)
                if not selected or vim.tbl_isempty(selected) then return end
                require("fzf-lua").live_grep({ cwd = root, search_dirs = selected })
            end,
        },
    })
end, { remap = false, desc = "Live grep in multiple Git subdirs" })
set("n", "<LocalLeader>g", "<cmd>lua require('fzf-lua').grep_project()<CR>",
    { remap = false, desc = "Live grep in project" })
set("n", "<LocalLeader><BS>", "<cmd>lua require('fzf-lua').grep_cword()<CR>",
    { remap = false, desc = "Grep current word" })
set("n", "<LocalLeader>b", "<cmd>lua require('fzf-lua').buffers()<CR>", { remap = false, desc = "List buffers" })
set("n", "<LocalLeader>j", "<cmd>lua require('fzf-lua').jumps()<CR>", { remap = false, desc = "List jump locations" })
set("n", "<LocalLeader>h", "<cmd>lua require('fzf-lua').help_tags()<CR>", { remap = false, desc = "Search help tags" })
set("n", "<LocalLeader>l", "<cmd>lua require('fzf-lua').blines()<CR>", { remap = false, desc = "Search lines in buffer" })
set("n", "<LocalLeader>m", "<cmd>lua require('fzf-lua').marks()<CR>", { remap = false, desc = "List marks" })
set("n", "<LocalLeader>t", "<cmd>lua require('fzf-lua').tabs()<CR>", { remap = false, desc = "List tabs" })
set("n", "<localleader>?", "<cmd>lua require('fzf-lua').keymaps()<CR>", { remap = false, desc = "List keymaps" })
set("n", "<localleader>s", "<cmd>lua require('fzf-lua').colorschemes()<CR>", { remap = false, desc = "Switch colorscheme" })
set("n", "<localleader>/", "<cmd>lua require('fzf-lua').search_history()<CR>", { remap = false, desc = "Search history" })
set("n", "<localleader>r", "<cmd>lua require('fzf-lua').command_history()<CR>", { remap = false, desc = "Command history" })
set("n", "<localleader>y", "<cmd>lua require('fzf-lua').oldfiles()<CR>", { remap = false, desc = "Recent files" })
set("n", "<localleader>C", "<cmd>lua require('fzf-lua').git_bcommits()<CR>", { remap = false, desc = "Git buffer commits" })
set("n", "<localleader>c", "<cmd>lua require('fzf-lua').git_commits()<CR>", { remap = false, desc = "Git repo commits" })
set("i", "<C-x><C-j>", "<cmd>lua require('fzf-lua').fzf_complete()<CR>", { remap = false, desc = "Fzf completion" })
set("i", "<C-x><C-l>", "<cmd>lua require('fzf-lua').complete_line()<CR>", { remap = false, desc = "Complete line" })
set("i", "<C-x><C-t>", "<cmd>lua require('fzf-lua').complete_bline()<CR>", { remap = false, desc = "Complete buffer line" })

-- lsp-zero
function LspZeroKeyMap(_, bufnr)
    local show_virtual_text = true
    local noremap = { buffer = bufnr, remap = false }

    return {
        set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', noremap),
        set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', noremap),
        set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', noremap),
        set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', noremap),
        set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', noremap),
        set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', noremap),
        set('n', 'gK', '<cmd>lua vim.lsp.buf.signature_help()<cr>', noremap),
        set('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<cr>', noremap),
        set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', noremap),
        set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', noremap),
        set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', noremap),
        set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', noremap),
        set('n', 'gv', function()
            show_virtual_text = not show_virtual_text

            if show_virtual_text then
                vim.diagnostic.config({ virtual_text = true })
            else
                vim.diagnostic.config({ virtual_text = false })
            end
        end, noremap)
    }
end

-- nvim-cmp
function NvimCmpKeyMap(cmp)
    return {
        ['<C-c>'] = cmp.mapping.abort(),
        ['<C-l>'] = cmp.mapping.confirm(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<Down>'] = cmp.mapping.scroll_docs(4),
        ['<Up>'] = cmp.mapping.scroll_docs(-4),
    }
end
