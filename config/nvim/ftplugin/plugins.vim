" itchyny/lightline -------------------{{{
let g:lightline = {
      \ 'colorscheme': 'rigel',
      \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
      \ 'subseparator': { 'left': '>', 'right': '' },
      \ 'active': {
      \   'left': [ [ 'paste' ],
      \             [ 'readonly', 'filename', 'gitbranch', 'fugitive', 'modified'] ],
      \   'right': [ [ 'cocstatus', 'currentfunction' ],
      \              [ 'lineinfo', 'percent' ] ]
      \ },
      \ 'inactive': {
      \    'left': [ [ 'relativepath' ] ]
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
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
" }}}

" nathanaelkane/vim-indent-guides -----{{{
let g:indent_guides_auto_colors = 1
let g:indent_guides_color_change_percent = 1
let g:indent_guides_enable_on_vim_startup = 1
" }}}

" alvan/vim-closetag ------------------{{{
let g:closetag_filenames = '*.html,*.jsx,*.js,*.tsx,*.html.erb'          " close tags on these files
" }}}

" airblade/vim-gitgutter --------------{{{
let g:gitgutter_enabled = 1                                        " Init GitGutter
let g:gitgutter_sign_allow_clobber = 0                             " git gutter symbols to have lowest priority
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

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

let g:coc_global_extensions = ['coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-snippets']
" }}}

" scrooloose/NERDTree -----------------{{{
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeRespectWildIgnore = 0
let g:NERDTreeAutoDeleteBuffer = 0
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeHijackNetrw = 1
let NERDTreeShowBookmarks=1
" let g:NERDTreeBookmarksFile = $VARPATH.'/treemarks'
let NERDTreeIgnore = [
      \ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.svn$',
      \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.cache$'
      \ ]
let g:NERDTreeMapOpenSplit = '<C-x>'
let g:NERDTreeMapOpenVSplit = '<C-v>'
let g:NERDTreeMapOpenInTab = '<C-t>'
let g:NERDTreeMapOpenInTabSilent = 'sT'
let g:NERDTreeMapUpdirKeepOpen = '<BS>'
let g:NERDTreeMapOpenRecursively = 't'
let g:NERDTreeMapCloseChildren = 'T'
let g:NERDTreeMapToggleHidden = '.'
let NERDTreeHighlightCursorline=0
" }}}
