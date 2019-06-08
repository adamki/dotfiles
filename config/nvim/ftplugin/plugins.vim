" vim-airline/vim-airline -------------{{{
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif                                                              " set up symbol dictionary
let g:airline_powerline_fonts = 1                                  " enable powerline icons
let g:airline_symbols.branch = ''                                 " git branch symbol!
let g:airline_inactive_collapse=1                                  " truncate left side of status bar for inactive windows
let g:airline#extensions#tabline#enabled = 1                       " enables tabline
let g:airline#extensions#branch#enabled = 1                        " integrate fugitive
let g:airline#extensions#branch#empty_message = 'Not in Git Repo'  " output if !git
let g:airline#extensions#ale#enabled = 1                           " integrate ALE linter
let g:airline#extensions#ale#show_line_numbers = 1                   " show ALE output
" }}}

" sheerun/vim-polyglot ----------------{{{
let g:polyglot_disabled = ['javascript', 'json', 'jsx', 'tsx']            " these are disabled so that dedicated JS Plugins do the syntax highlighting
" }}}

" Pangloss/vim-javascript -------------{{{
let g:javascript_plugin_flow = 1                                   " enables syntax highlight for flow.js
"  }}}

" nathanaelkane/vim-indent-guides -----{{{
let g:indent_guides_enable_on_vim_startup = 1                      " initialize the indent lines on startup
let g:indent_guides_color_change_percent = 5                       " make the indent lines very dim
let g:indent_guides_guide_size = 1                                 " make the indent lines skinny
" }}}

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

" Shougo/deoplete.nvim ----------------{{{
" let g:deoplete#file#enable_buffer_path=1                         " I THINK THIS CAN BE REMOVED
let g:deoplete#enable_at_startup = 1                               " start Deoplete always
let g:jsx_ext_required = 0                                         " use deoplete for .jsx
autocmd CompleteDone * pclose                                      " close the preview window after completion is done.
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"            " deoplete tab-scroll
" }}}

" ternjs/tern_for_vim -----------------{{{
let g:tern_request_timeout = 1                                     " let carlitux Use deoplete.
let g:tern_show_signature_in_pum = '0'                             " This do disable full signature type on autocomplete
" turn off case sensitive matches
let g:deoplete#sources#ternjs#case_insensitive = 1
" Add extra filetypes
let g:tern#filetypes = [
      \ 'jsx',
      \ 'javascript.jsx',
      \ 'vue'
      \ ]
let g:tern#command = ["tern"]                                      " Use tern_for_vim
let g:tern#arguments = ["--persistent"]
" jump to definition
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR> let g:tern#is_show_argument_hints_enabled = 1
" jump to definition in new buffer
autocmd FileType javascript nnoremap <silent> <buffer> gb! :TernDefSplit<CR>
" }}}

" w0rp/ale ----------------------------{{{
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
      \  'go': ['golint'],
      \  'html': ['htmlhint'],
      \  'jsx': ['eslint'],
      \  'javascript': ['eslint'],
      \ }
let b:ale_fixers = {
      \'javascript': ['prettier', 'eslint'],
      \'js': ['prettier', 'eslint'],
      \'tsx': ['prettier', 'eslint']
      \}
let g:ale_echo_msg_format = 'ALE: [%linter%] %s [%severity%]'
" }}}

" mhartington/nvim-typescript ---------{{{
  " disable auto check
  let g:nvim_typescript#diagnostics_enable = 0
  " only auto check on save/write
  autocmd BufWrite *.ts,*.tsx TSGetDiagnostics
" }}}
