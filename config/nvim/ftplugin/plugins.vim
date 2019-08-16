" itchyny/lightline -------------------{{{
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'active': {
      \   'left': [ [ 'paste' ],
      \             [ 'readonly', 'filename', 'gitbranch', 'fugitive', 'modified'] ],
      \   'right': [ [ 'cocstatus', 'currentfunction' ],
      \              [ 'lineinfo', 'percent' ],
      \              [  ] ]
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

" Pangloss/vim-javascript -------------{{{
let g:javascript_plugin_flow = 1                                   " enables syntax highlight for flow.js
"  }}}

" alvan/vim-closetag ------------------{{{
let g:closetag_filenames = '*.html,*.jsx,*.js,*.tsx,*.html.erb'          " close tags on these files
" }}}

" christoomey/vim-tmux-navigator ------{{{
let g:tmux_navigator_disable_when_zoomed = 1                       " Disable tmux navigator when zooming the Vim pane
" }}}

" airblade/vim-gitgutter --------------{{{
let g:gitgutter_enabled = 1                                        " Init GitGutter
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
set rtp+=/usr/local/opt/fzf                                        " set run time path of fzf install
let g:fzf_history_dir = '~/.local/share/fzf-history'               " enable <C-n>/<C-p> as tab thru previous fzf sessions
" }}}

" pbogut/fzf-mru ----------------------{{{
let g:fzf_mru_relative = 1
" }}}

" neoclide/coc.vim --------------------{{{
let g:coc_global_extensions = ['coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-snippets']
" }}}
