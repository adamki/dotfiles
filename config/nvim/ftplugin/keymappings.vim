" no ex mode
nnoremap Q <nop>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>x :x<CR>
" reload nvimrc from source
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>
" copy current file path
nmap cp :let @+= expand("%") <cr>
" bind Search/Replace to Leader
nnoremap <Leader>S :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
" better line end navigation
" !!!! Temp disabled as it overrides (H)igh, (M)iddle, (L)low
" noremap H ^
" noremap L g_
" vim omnicomplete
inoremap <C-f> <C-x><C-f>
" better lateral block movement
vmap < <gv
vmap > >gv

" Use tab for indenting in visual mode
vnoremap <Tab> >gv|
vnoremap <S-Tab> <gv
nnoremap > >>_
nnoremap < <<_

" turn off high-lighted search results
nnoremap <Space>, :noh<cr>

" move lines in normal
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

" move lines in insert
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

" Window Management
let g:elite_mode = 1
if get(g:, 'elite_mode')
  nnoremap <Up>    :resize +2<CR>
  nnoremap <Down>  :resize -2<CR>
  nnoremap <Left>  :vertical resize +2<CR>
  nnoremap <Right> :vertical resize -2<CR>
endif
