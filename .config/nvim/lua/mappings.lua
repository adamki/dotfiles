local set = vim.keymap.set

set("n", "<Leader>w", ":w<CR>")
set("n", "<Leader>q", ":q<CR>")
set("n", "<Leader>Q", ":q!<CR>")
set("n", "<Leader>x", ":x<CR>")

set("n", "<LocalLeader>z", "<C-W>_<C-W><Bar>")

set("n", "<Up>", ":resize +2<CR>")
set("n", "<Down>", ":resize -2<CR>")
set("n", "<Left>", ":vertical resize +2<CR>")
set("n", "<Right>", ":vertical resize -2<CR>")

set("n", "]b", ":bnext<CR>")
set("n", "[b", ":bprev<CR>")

set("n", "cp", ":let @+= expand('%') <CR>")
set("n", "<Leader>S", ":%s/<C-r><C-w>//gc<Left><Left><Left>")
set("n", "<C-J>", "<C-W><C-J>")
set("n", "<C-K>", "<C-W><C-K>")
set("n", "<C-L>", "<C-W><C-L>")
set("n", "<C-H>", "<C-W><C-H>")

set("n", "tq", ":tabclose")
set("n", "tt", ":tabnew")

set("n", "0", "^")
set("i", "<C-f>", "<C-x><C-f>")

set("v", "<", "<gv")
set("v", ">", ">gv")
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "<F3>", ":echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '> trans<' . synIDattr(synID(line('.'),col('.'),0),'name') . '> lo<' . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>' . ' FG:' . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'fg#')<CR>")

-- NvimTree
set("n", "-", ":NvimTreeFindFileToggle .<CR>")

-- Gitsigns
set("n", "]c", "<cmd>lua require('gitsigns').next_hunk()<Cr>")
set("n", "[c", "<cmd>lua require('gitsigns').prev_hunk()<Cr>")

-- FzfLua
set("n", "<LocalLeader>,", ":FzfLua")
set("n", "<LocalLeader>f", "<cmd>lua require('fzf-lua').files()<CR>")
set("n", "<LocalLeader>g", "<cmd>lua require('fzf-lua').grep_project()<CR>")
set("n", "<LocalLeader><BS>", "<cmd>lua require('fzf-lua').grep_cword()<CR>")
set("n", "<LocalLeader>b", "<cmd>lua require('fzf-lua').buffers()<CR>")
set("n", "<LocalLeader>h", "<cmd>lua require('fzf-lua').help_tags()<CR>")
set("n", "<LocalLeader>l", "<cmd>lua require('fzf-lua').blines()<CR>")
set("n", "<LocalLeader>m", "<cmd>lua require('fzf-lua').marks()<CR>")
set("n", "<LocalLeader>t", "<cmd>lua require('fzf-lua').tabs()<CR>")
set("n", "<localleader>?", "<cmd>lua require('fzf-lua').keymaps()<CR>")
set("n", "<localleader>s", "<cmd>lua require('fzf-lua').colorschemes()<CR>")
set("n", "<localleader>/", "<cmd>lua require('fzf-lua').search_history()<CR>")
set("n", "<localleader>r", "<cmd>lua require('fzf-lua').command_history()<CR>")
set("n", "<localleader>y", "<cmd>lua require('fzf-lua').oldfiles()<CR>") -- all recent files(not project specific)
set("n", "<localleader>C", "<cmd>lua require('fzf-lua').git_bcommits()<CR>") -- commits for curr buffer/file
set("n", "<localleader>c", "<cmd>lua require('fzf-lua').git_commits()<CR>") --commits for repo
set("i", "<C-x><C-j>", "<cmd>lua require('fzf-lua').fzf_complete()<CR>")
set("i", "<C-x><C-l>", "<cmd>lua require('fzf-lua').complete_line()<CR>")
set("i", "<C-x><C-t>", "<cmd>lua require('fzf-lua').complete_bline()<CR>")

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
        vim.diagnostic.config({ virtual_text=true})
      else
        vim.diagnostic.config({ virtual_text=false})
      end
    end, noremap)
  }
end

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
