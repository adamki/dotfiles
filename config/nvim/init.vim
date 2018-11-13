" {{{ VIM-Plug
  call plug#begin('~/.local/share/nvim/plugged')
  " colors
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'trevordmiller/nova-vim'
  Plug 'chriskempson/base16-vim'

  " syntax
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'sheerun/vim-polyglot' " {{{ polyglot
    let g:polyglot_disabled = ['javascript', 'json', 'jsx']            " these are disabled so that dedicated JS Plugins do the syntax highlighting
  " }}}
  Plug 'pangloss/vim-javascript' " {{{ pangloss/vim-javascript
    let g:javascript_plugin_flow = 1                                   " enables syntax highlight for flow.js
  " }}}

  " Folding (see fold section)
  Plug 'nelstrom/vim-markdown-folding', {'for': 'markdown'}

  " improve Vim interface
  Plug 'itchyny/vim-cursorword'
  Plug 'szw/vim-maximizer', {'on': ['Maximizer', 'MaximizerToggle']}
  Plug 'terryma/vim-expand-region'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
  Plug 'nathanaelkane/vim-indent-guides' " {{{ indent-guides

    let g:indent_guides_enable_on_vim_startup = 1                      " initialize the indent lines on startup
    let g:indent_guides_color_change_percent = 5                       " make the indent lines very dim
    let g:indent_guides_guide_size = 1                                 " make the indent lines skinny
  "  }}}
  Plug 'alvan/vim-closetag' " {{{ close-tag
    let g:closetag_filenames = '*.html,*.jsx,*.js,*.html.erb'          " close tags on these files
  "}}}
  Plug 'vim-airline/vim-airline' " {{{ airline
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
    let airline#extensions#ale#show_line_numbers = 1                   " show ALE output
  " }}}
  Plug 'ryanoasis/vim-devicons' " {{{ devicons
    " after a re-source, fix syntax matching issues (concealing brackets):
    if exists('g:loaded_webdevicons')
      call webdevicons#refresh()
    endif
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
    let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''
  " }}}

  Plug 'tomtom/tcomment_vim'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'christoomey/vim-tmux-navigator' " {{{ vim-tmux-navigator
    let g:tmux_navigator_disable_when_zoomed = 1                       " Disable tmux navigator when zooming the Vim pane
  " }}}
  Plug 'airblade/vim-gitgutter' " {{{ git-gutter
    let g:gitgutter_enabled = 1                                        " Init GitGutter
  " }}}
  Plug 'shime/vim-livedown', {'for': 'markdown'} " {{{ liveDown
    let g:livedown_autorun = 1                                          " automatically launch new browser/preview
    let g:livedown_open = 1                                             " browser automatically opens window upon previewing
  " }}}
  Plug 'easymotion/vim-easymotion' " {{{ easy-motion
    let g:EasyMotion_smartcase = 1                                     " match upper and lower case
    let g:EasyMotion_use_smartsign_us = 1                              " match smart chars
  " }}}

  " vim extensions
  Plug 'jreybert/vimagit', {'on': ['Magit', 'MagitOnly']}
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-eunuch'
  Plug 'k0kubun/vim-open-github'
  Plug 'junegunn/fzf.vim' " {{{ FZF.vim
    set rtp+=/usr/local/opt/fzf                                        " set run time path of fzf install
    let g:fzf_history_dir = '~/.local/share/fzf-history'               " enable <C-n>/<C-p> as tab thru previous fzf sessions
  " }}}

  " IDE level enhancements
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'sebdah/vim-delve'
  Plug 'jodosha/vim-godebug'
  Plug 'majutsushi/tagbar'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } "{{{ VIM-GO
    let g:go_auto_type_info = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_types = 1
    let g:go_fmt_command = "goimports"
  "  }}}
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " {{{ deoplete
    " let g:deoplete#file#enable_buffer_path=1                         " I THINK THIS CAN BE REMOVED
    let g:deoplete#enable_at_startup = 1                               " start Deoplete always
    let g:jsx_ext_required = 0                                         " use deoplete for .jsx
    autocmd CompleteDone * pclose                                      " close the preview window after completion is done.
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"            " deoplete tab-scroll
  " }}}
  Plug 'ternjs/tern_for_vim', {'do': 'npm install'} " {{{ tern for vim
    " let carlitux Use deoplete.
    let g:tern_request_timeout = 1
    let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
    " turn off case sensitive matches
    let g:deoplete#sources#ternjs#case_insensitive = 1
    "Add extra filetypes
    let g:tern#filetypes = [
          \ 'jsx',
          \ 'javascript.jsx',
          \ 'vue'
          \ ]
    " Use tern_for_vim.
    let g:tern#command = ["tern"]
    let g:tern#arguments = ["--persistent"]
    " jump to definition
    autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR> let g:tern#is_show_argument_hints_enabled = 1
    " jump to definition in new buffer
    autocmd FileType javascript nnoremap <silent> <buffer> gb! :TernDefSplit<CR>
  " }}}
  Plug 'w0rp/ale' " {{{ ALE
    let g:ale_linters = {
          \  'jsx': ['eslint'],
          \  'javascript': ['eslint'],
          \  'ruby': ['rubocop']
          \ }
    let b:ale_fixers = {
          \'javascript': ['prettier', 'eslint'],
          \'js': ['prettier', 'eslint']
          \}
  "  }}}

  call plug#end()
" }}}

" {{{ filetype imports
  source ~/.config/nvim/ftplugin/fold.vim
  source ~/.config/nvim/ftplugin/aesthetic.vim
  source ~/.config/nvim/ftplugin/system.vim
  source ~/.config/nvim/ftplugin/keymappings.vim
  source ~/.config/nvim/ftplugin/nerdtree.vim
  source ~/.config/nvim/ftplugin/filetypes.vim
" }}}

" {{{ VIM-initialize
  call Set_italics()
" }}}
