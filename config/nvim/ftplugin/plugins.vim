" alvan/vim-closetag ------------------{{{
let g:closetag_filenames = '*.html,*.jsx,*.js,*.tsx,*.html.erb'          " close tags on these files
" }}}

" iamcco/markdown-preview.nvim---------{{{
let g:mkdp_auto_start = 1
" }}}

" junegunn/fzf.vim --------------------{{{
let g:fzf_history_dir = '~/.local/share/fzf-history'               " enable <C-n>/<C-p> as tab thru previous fzf sessions
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" let Rg show a preview window
" see instructions here: https://github.com/junegunn/fzf.vim#example-rg-command-with-preview-window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
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
  \'coc-snippets',
  \]

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

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
"disable indentLine's strange concealling behavior(EX: hides quotes in JSON file)
autocmd FileType markdown let g:indentLine_enabled=0
" Force IntentLine plugin to display quotes in JSON
let g:vim_json_syntax_conceal = 0
let g:indentLine_char = '┊'
"}}}

" justinmk/vim-sneak ------------------{{{
let g:sneak#s_next = 1
" }}}
