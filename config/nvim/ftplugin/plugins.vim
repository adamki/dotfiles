" vim-airline/vim-airline -------------{{{
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif                                                              " set up symbol dictionary
let g:airline_powerline_fonts = 1                                  " enable powerline icons
let g:airline_symbols.branch = ''                                 " git branch symbol!
let g:airline_inactive_collapse=1                                  " truncate left side of status bar for inactive windows
let g:airline#extensions#tabline#enabled = 0                       " enables tabline
let g:airline#extensions#branch#enabled = 1                        " integrate fugitive
let g:airline#extensions#branch#empty_message = 'Not in Git Repo'  " output if !git
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

" neoclide/coc.vim ---------------------{{{
let g:coc_global_extensions = ['coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-yank']
" }}}
