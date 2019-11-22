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
nnoremap <F2> :<C-u>call NumberToggle()<CR>

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
" Explorer(COC)
nmap - :CocCommand explorer<CR>
" Use `[c` and `]c` to navigate diagnostics(COC)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
" Remap keys for gotos(COC)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window(COC)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" multiple cursors(COC)
nmap <expr> <silent> <C-space> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc
" CocList utils(COC)
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>y  :<C-u>CocList -A yank<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" rename current word(COC)
nmap <leader>rn <Plug>(coc-rename)
" format selected region(COC)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Use <C-a> for select selections ranges, needs server support, like: coc-tsserver, coc-python
xmap <Tab> <Plug>(coc-range-select)
xmap <S-Tab> <Plug>(coc-range-select-backword)
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

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
    autocmd BufEnter,FocusGained,InsertLeave * set norelativenumber number
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber number
  else
    set relativenumber number
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber number
    autocmd BufLeave,FocusLost,InsertEnter   * set relativenumber number
  endif
endfunc
" }}}
