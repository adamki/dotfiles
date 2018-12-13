" no ex mode
nnoremap Q <nop>
" enable ESC behavior when in terminal emulator
tnoremap <Esc> <C-\><C-n>
" reload nvimrc from source
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>

" writing/exiting nvim
nnoremap <Leader>w :w<CR>
nnoremap q         :q<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>x :x<CR>

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

" Toggle Maximizer
nnoremap <LocalLeader>z :MaximizerToggle!<CR>

" Git Gutter
nnoremap <Leader>ga :GitGutterStageHunk<cr>
nnoremap <Leader>gt :GitGutterLineHighlightsToggle<cr>

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
" nnoremap > >>_
" nnoremap < <<_

" move lines in normal
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
" move lines in insert
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

" FINDING
nnoremap <LocalLeader>ff   :Files<cr>
nnoremap <LocalLeader>F    :Files <c-r>=fnameescape(expand('%:p:h'))<cr><cr>
nnoremap <LocalLeader>gg   :Rg<cr>
nnoremap <LocalLeader><bs> :Rg <C-R><C-W><CR>

" NAVIGATING
nnoremap <LocalLeader>L    :Lines<cr>
nnoremap <LocalLeader>b    :Buffers<cr>
nnoremap <LocalLeader>h    :Helptags<cr>
nnoremap <LocalLeader>l    :BLines<cr>
nnoremap <LocalLeader>m    :Marks<cr>
nnoremap <LocalLeader>t    :Tags<cr>
nnoremap <LocalLeader>w    :Windows<cr>

" RECENTS
nnoremap <LocalLeader>/    :History/<cr>
nnoremap <LocalLeader>r    :History:<cr>
nnoremap <LocalLeader>y    :FZFMru<cr>

" GIT
nnoremap <LocalLeader>C    :BCommits<cr>
nnoremap <LocalLeader>c    :Commits<cr>
nnoremap <LocalLeader>g    :GFiles?<cr>
nnoremap <LocalLeader>gf   :GFiles<cr>

" SYSTEM COMMANDS
nnoremap <LocalLeader>:    :Commands<cr>

" COMPLETION
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-l> <plug>(fzf-complete-line)
imap <c-x><c-t> <plug>(fzf-complete-buffer-line)

" MISCELLANEOUS
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" toggle_background
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

nnoremap <Leader>b :<C-u>call <SID>toggle_background()<CR>
