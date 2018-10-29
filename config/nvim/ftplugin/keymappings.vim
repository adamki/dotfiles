" no ex mode
nnoremap Q <nop>


" reload nvimrc from source
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>

" writing/exiting nvim
nnoremap <Leader>w :w<CR>
nnoremap q         :q<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>x :x<CR>

" WINDOWS
nmap <Tab>   <C-w>w
nmap <S-Tab> <C-w>W

let g:elite_mode = 1
if get(g:, 'elite_mode')
  nnoremap <Up>    :resize +2<CR>
  nnoremap <Down>  :resize -2<CR>
  nnoremap <Left>  :vertical resize +2<CR>
  nnoremap <Right> :vertical resize -2<CR>
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

" NERDTree invocation
nnoremap <silent> <LocalLeader>e :<C-u>NERDTreeToggle<CR>
nnoremap <silent> <LocalLeader>a :<C-u>NERDTreeFind<CR>

" copy current file path
nmap cp :let @+= expand("%") <cr>

" bind Search/Replace to Leader
nnoremap <Leader>S :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" toggle relativenumber / norelativenumber
nmap <F2> :set rnu! nornu?<cr>

" better line end navigation
noremap 0 ^

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

" move lines in normal
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
" move lines in insert
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

function! s:toggle_background()
  if ! exists('g:colors_name')
    echomsg 'No colorscheme set'
    return
  endif
  let l:scheme = g:colors_name

  if l:scheme =~# 'dark' || l:scheme =~# 'light'
    " Rotate between different theme backgrounds
    execute 'colorscheme' (l:scheme =~# 'dark'
          \ ? substitute(l:scheme, 'dark', 'light', '')
          \ : substitute(l:scheme, 'light', 'dark', ''))
  else
    execute 'set background='.(&background ==# 'dark' ? 'light' : 'dark')
    if ! exists('g:colors_name')
      execute 'colorscheme' l:scheme
      echomsg 'The colorscheme `'.l:scheme
            \ .'` doesn''t have background variants!'
    else
      echo 'Set colorscheme to '.&background.' mode'
    endif
  endif
  call Set_italics()
endfunction

" toggle background
nnoremap <silent><Leader>b :<C-u>call <SID>toggle_background()<CR>

