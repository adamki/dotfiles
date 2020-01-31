" alvan/vim-closetag ------------------{{{
let g:closetag_filenames = '*.html,*.jsx,*.js,*.tsx,*.html.erb'          " close tags on these files
" }}}

" shime/vim-livedown ------------------{{{
let g:livedown_autorun = 1                                          " automatically launch new browser/preview
let g:livedown_open = 1                                             " browser automatically opens window upon previewing
" }}}

" junegunn/fzf.vim --------------------{{{
let g:fzf_history_dir = '~/.local/share/fzf-history'               " enable <C-n>/<C-p> as tab thru previous fzf sessions
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" let Rg show a preview window
" see instructions here: https://github.com/junegunn/fzf.vim#example-rg-command-with-preview-window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
" }}}

" pbogut/fzf-mru ----------------------{{{
let g:fzf_mru_relative = 1
" }}}

" neoclide/coc.vim --------------------{{{
let g:coc_global_extensions = [
  \'coc-git',
  \'coc-vimlsp',
  \'coc-eslint',
  \'coc-yank',
  \'coc-json',
  \'coc-tsserver',
  \'coc-html',
  \'coc-css',
  \'coc-explorer',
  \'coc-highlight',
  \]

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
"
" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" " }}}

" Yggdroot/indentLine -----------------{{{
 let g:indentLine_fileTypeExclude = ['coc-explorer']
"}}}
