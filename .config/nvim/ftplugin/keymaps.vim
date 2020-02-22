" {{{ SYSTEM
" " no ex mode
nnoremap Q <nop>
" enable ESC behavior when in terminal emulator
tnoremap <Esc> <C-\><C-n>
" reload nvimrc from source
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>
" writing/exiting nvim
nnoremap <Leader>w :w<CR>
" nnoremap q         :q<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>x :x<CR>
let g:elite_mode = 1
if get(g:, 'elite_mode')
  nnoremap <S-Up>    :resize +2<CR>
  nnoremap <S-Down>  :resize -2<CR>
  nnoremap <S-Left>  :vertical resize +2<CR>
  nnoremap <S-Right> :vertical resize -2<CR>
endif
" BUFFERS
nmap ]b :bnext<CR>
nmap [b :bprev<CR>
" TABS
nnoremap tq  :Sayonara<CR>
nnoremap tt  :tabnew<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap th  :tabfirst<CR>
nnoremap tl  :tablast<CR>
" copy current file path
nmap cp :let @+= expand("%") <CR>
" bind Search/Replace to Leader
nnoremap <Leader>S :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
" toggle relativenumber / norelativenumber
" nmap <F2> :set rnu! nornu?<CR>
nnoremap <F2> :<C-u>call Toggle_number()<CR>
" toggle background
nnoremap <Leader>b :call Toggle_background()<CR>
" print vim ID of char under cursor
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
" better line end navigation
noremap 0 ^
" vim omnicomplete
inoremap <C-f> <C-x><C-f>
" better lateral block movement
vmap < <gv
vmap > >gv
" nnoremap > >>_
" nnoremap < <<_
" move lines in visual
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" easier split(s) navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}

" {{{ PLUGS
" Maximizer Toggling
nnoremap <LocalLeader>z :MaximizerToggle!<CR>
" FINDING(FZF)
nnoremap <LocalLeader>f    :Files<CR>
nnoremap <LocalLeader>F    :Files <c-r>=fnameescape(expand('%:p:h'))<CR><CR>
nnoremap <LocalLeader>g    :Rg<CR>
nnoremap <LocalLeader><bs> :Rg <C-R><C-W><CR>
" NAVIGATING(FZF)
nnoremap <LocalLeader>b    :Buffers<CR>
nnoremap <LocalLeader>h    :Helptags<CR>
nnoremap <LocalLeader>l    :BLines<CR>
nnoremap <LocalLeader>L    :Lines<CR>
nnoremap <LocalLeader>m    :Marks<CR>
nnoremap <LocalLeader>t    :Tags<CR>
nnoremap <LocalLeader>w    :Windows<CR>
" RECENTS(FZF)
nnoremap <LocalLeader>/    :History/<CR>
nnoremap <LocalLeader>r    :History:<CR>
nnoremap <LocalLeader>y    :FZFMru<CR>
" GIT(FZF)
nnoremap <LocalLeader>C    :BCommits<CR>
nnoremap <LocalLeader>c    :Commits<CR>
nnoremap <LocalLeader>Gs   :GFiles?<CR>
nnoremap <LocalLeader>Gf   :GFiles<CR>
" SYSTEM COMMANDS(FZF)
nnoremap <LocalLeader>:    :Commands<CR>
" COMPLETION(FZF)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-t> <plug>(fzf-complete-buffer-line)
" MISCELLANEOUS(FZF)
nmap <LocalLeader><tab> <plug>(fzf-maps-n)
xmap <LocalLeader><tab> <plug>(fzf-maps-x)
omap <LocalLeader><tab> <plug>(fzf-maps-o)
imap <LocalLeader><tab> <plug>(fzf-maps-i)
" SNIPPETS(COC)
imap <C-l> <Plug>(coc-snippets-expand)
" Explorer(COC)
nmap - :CocCommand explorer<CR>
" Use `[d` and `]d` to navigate diagnostics(COC)
nmap [d <Plug>(coc-diagnostic-prev)
nmap ]d <Plug>(coc-diagnostic-next)
" Use `[g` and `]g` to navigate git changes(COC)
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
" Remap keys for gotos(COC)
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
" Use K to show documentation in preview window(COC)
nnoremap <silent> K :call Show_documentation()<CR>
" multiple cursors(COC)
nmap <expr> <silent> <C-space> Select_current_word()
" CocList utils(COC)
nnoremap <space><space> :<C-u>CocList <cr>
nnoremap <space>a :<C-u>CocList diagnostics<cr>
nnoremap <space>e :<C-u>CocList extensions<cr>
nnoremap <space>c :<C-u>CocList commands<cr>
nnoremap <space>o :<C-u>CocList outline<cr>
nnoremap <space>s :<C-u>CocList -I symbols<cr>
nnoremap <space>y :<C-u>CocList -A yank<cr>
nnoremap <space>j :<C-u>CocNext<CR>
nnoremap <space>k :<C-u>CocPrev<CR>
nnoremap <space>p :<C-u>CocListResume<CR>
" rename current word(COC)
nmap <leader>rn <Plug>(coc-rename)
" format selected region(COC)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Use <Tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" DO NOT MAP TO <TAB> as this overwrites default <C-i> behaviour
vmap <Tab> <Plug>(coc-range-select)
vmap <Tab> <Plug>(coc-range-select)
vmap <S-Tab> <Plug>(coc-range-select-backward)
xmap <S-Tab> <Plug>(coc-range-select-backward)
" CTRL + j/k to tab through autocomplete selections
inoremap <expr> <C-j> pumvisible() ? '<C-n>' : ''
inoremap <expr> <C-k> pumvisible() ? '<C-p>' : ''
" }}}