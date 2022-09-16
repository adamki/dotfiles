local set = vim.keymap.set

set("n", "<Leader>r", ":so ~/.config/nvim/init.lua<CR>")
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

-- FZF
set("n", "<LocalLeader>,", ":Fuzzy")
set("n", "<LocalLeader>f", ":FuzzyFiles<CR>")
set("n", "<LocalLeader>F", ":FuzzyFiles <c-r>=fnameescape(expand('%:p:h'))<CR><CR>")
set("n", "<LocalLeader>g", ":FuzzyRg<CR>")
set("n", "<LocalLeader><bs>", ":FuzzyRg <C-R><C-W><CR>")
set("n", "<LocalLeader>b", ":FuzzyBuffers<CR>")
set("n", "<LocalLeader>h", ":FuzzyHelptags<CR>")
set("n", "<LocalLeader>l", ":FuzzyBLines<CR>")
set("n", "<LocalLeader>L", ":FuzzyLines<CR>")
set("n", "<LocalLeader>m", ":FuzzyMarks<CR>")
set("n", "<LocalLeader>?", ":FuzzyMaps<CR>")
set("n", "<LocalLeader>t", ":FuzzyTags<CR>")
set("n", "<LocalLeader>T", ":FuzzyBTags<CR>")
set("n", "<LocalLeader>w", ":FuzzyWindows<CR>")
set("n", "<LocalLeader>/", ":FuzzyHistory/<CR>") -- search history
set("n", "<LocalLeader>r", ":FuzzyHistory:<CR>") -- command history
set("n", "<LocalLeader>y", ":FuzzyHistory<CR>")
set("n", "<LocalLeader>C", ":FuzzyBCommits<CR>")
set("n", "<LocalLeader>c", ":FuzzyCommits<CR>")
set("n", "<LocalLeader>Gs", ":FuzzyGFiles?<CR>")
set("n", "<LocalLeader>Gf", ":FuzzyGFiles<CR>")
set("n", "<LocalLeader>:", ":FuzzyCommands<CR>")

set("i", "<c-x><c-f>", "<plug>(fzf-complete-path)")
set("i", "<c-x><c-j>", "<plug>(fzf-complete-file-ag)")
set("i", "<c-x><c-k>", "<plug>(fzf-complete-word)")
set("i", "<c-x><c-l>", "<plug>(fzf-complete-line)")
set("i", "<c-x><c-t>", "<plug>(fzf-complete-buffer-line)")

set("n", "<localleader><tab>", "<plug>(fzf-maps-n)")
set("i", "<localleader><tab>", "<plug>(fzf-maps-i)")
set("x", "<localleader><tab>", "<plug>(fzf-maps-x)")
set("o", "<localleader><tab>", "<plug>(fzf-maps-o)")

-- nvim-tree.lua
set("n", "-", ":NvimTreeFindFileToggle .<CR>")
