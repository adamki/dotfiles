" {{{ SYSTEM
" " no ex mode
nnoremap Q <nop>
" enable ESC behavior when in terminal emulator
tnoremap <Esc> <C-\><C-n>
" reload nvimrc from source
nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>
" writing/exiting nvim
nnoremap <Leader>w :w<CR>
nnoremap q         :q<CR>
nnoremap Q         :q!<CR>
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
" copy current file path
nmap cp :let @+= expand("%") <CR>
" bind Search/Replace to Leader
nnoremap <Leader>S :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
" toggle relativenumber / norelativenumber
nmap <F2> :set rnu! nornu?<CR>
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
" move lines in visual
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" }}}

" {{{ PLUGS
" NERDTree invocation
nnoremap <LocalLeader>e :<C-u>NERDTreeToggle<CR>
nnoremap <LocalLeader>a :<C-u>NERDTreeFind<CR>
" Maximizer Toggling
nnoremap <LocalLeader>z :MaximizerToggle!<CR>
" GitGutter
nnoremap <Leader>ga :GitGutterStageHunk<CR>
nnoremap <Leader>gt :GitGutterLineHighlightsToggle<CR>
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
" }}}

" {{{ MISC
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
" }}}
