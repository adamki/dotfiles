" alvan/vim-closetag ------------------{{{
let g:closetag_filenames = '*.html,*.jsx,*.js,*.tsx,*.html.erb'          " close tags on these files
" }}}

" junegunn/fzf.vim --------------------{{{
let g:fzf_history_dir = '~/.local/share/fzf-history'               " enable <C-n>/<C-p> as tab thru previous fzf sessions
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:fzf_command_prefix = 'Fuzzy'
let g:fzf_buffers_jump = 1
" let Rg show a preview window
" see instructions here: https://github.com/junegunn/fzf.vim#example-rg-command-with-preview-window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
" }}}

" neoclide/coc.vim --------------------{{{
let g:coc_global_extensions = [
  \'coc-css',
  \'coc-eslint',
  \'coc-explorer',
  \'coc-git',
  \'coc-highlight',
  \'coc-html',
  \'coc-json',
  \'coc-pyright',
  \'coc-snippets',
  \'coc-tsserver',
  \'coc-vimlsp',
  \'coc-yank',
  \]

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" cursor disappears after using coc#list. this is a temp fix
let g:coc_disable_transparent_cursor = 1

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

" luochen1990/rainbow -----------------{{{
let g:rainbow_active = 1
" }}}

" liuchengxu/vista.vim ----------------{{{
  let g:vista_default_executive = 'coc'
  let g:vista#renderer#enable_icon = 0
" }}}
