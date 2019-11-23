" itchyny/lightline -------------------{{{
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'active': {
      \   'left': [ [ 'paste', 'modified' ],
      \             [ 'gitbranch', 'fugitive' ],
      \             [ 'readonly', 'filename',  'modified']],
      \   'right': [ [ 'cocstatus', 'currentfunction' ],
      \              [ 'lineinfo']]
      \ },
      \ 'inactive': {
      \    'left': [ [ 'none' ], [ 'relativepath', 'modified' ]],
      \    'right': [ [] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
			\   'fugitive': 'LightlineFugitive'
      \ },
      \ }

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
" }}}

" alvan/vim-closetag ------------------{{{
let g:closetag_filenames = '*.html,*.jsx,*.js,*.tsx,*.html.erb'          " close tags on these files
" }}}

" shime/vim-livedown ------------------{{{
let g:livedown_autorun = 1                                          " automatically launch new browser/preview
let g:livedown_open = 1                                             " browser automatically opens window upon previewing
" }}}

" easymotion/vim-easymotion -----------{{{
let g:EasyMotion_smartcase = 1                                     " match upper and lower case
let g:EasyMotion_use_smartsign_us = 1                              " match smart chars
" }}}

" junegunn/fzf.vim --------------------{{{
let g:fzf_history_dir = '~/.local/share/fzf-history'               " enable <C-n>/<C-p> as tab thru previous fzf sessions

let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(18)
  let width = float2nr(135)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 2

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
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
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" }}}

" Yggdroot/indentLine -----------------{{{
let g:indentLine_fileTypeExclude = ['coc-explorer']
"}}}
