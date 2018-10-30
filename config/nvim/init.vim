" Setup Plug  --------------------------------------------------------------{{{

  call plug#begin('~/.local/share/nvim/plugged')
  " appearance - search - syntax - italix

  " colors
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'trevordmiller/nova-vim'
  Plug 'chriskempson/base16-vim'

  " syntax
  " Plug 'othree/yajs'
  " Plug 'othree/es.next.syntax.vim'
  " Plug 'jelera/vim-javascript-syntax'
  Plug 'sheerun/vim-polyglot'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'
  Plug 'othree/javascript-libraries-syntax.vim'

  " Folding (see fold section)
  Plug 'nelstrom/vim-markdown-folding', {'for': 'markdown'}

  " improve Vim interface
  Plug 'itchyny/vim-cursorword'
  Plug 'szw/vim-maximizer', {'on': ['Maximizer', 'MaximizerToggle']}
  Plug 'terryma/vim-expand-region'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'alvan/vim-closetag'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
  Plug 'ryanoasis/vim-devicons'
  Plug 'tomtom/tcomment_vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'airblade/vim-gitgutter'
  Plug 'shime/vim-livedown', {'for': 'markdown'}
  Plug 'easymotion/vim-easymotion'

  " vim extensions
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'jreybert/vimagit', {'on': ['Magit', 'MagitOnly']}
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-eunuch'
  Plug 'junegunn/fzf.vim'

  " IDE level enhancements
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
  Plug 'w0rp/ale'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  call plug#end()

" }}}

" ftplugin imports ---------------------------------------------------------{{{

  source ~/.config/nvim/ftplugin/aesthetic.vim
  source ~/.config/nvim/ftplugin/system.vim
  source ~/.config/nvim/ftplugin/keymappings.vim
  source ~/.config/nvim/ftplugin/nerdtree.vim
  source ~/.config/nvim/ftplugin/filetypes.vim

"  }}}

" MarkDown Live Previews ---------------------------------------------------{{{

  " should markdown preview get shown automatically upon opening markdown buffer
  let g:livedown_autorun = 1

  " should the browser window pop-up upon previewing
  let g:livedown_open = 1

" }}}

" Airline/TABS Config-------------------------------------------------------{{{
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif                                                                " set up symbol dictionary

  let g:airline_inactive_collapse=1

  let g:airline#extensions#tabline#enabled = 1                         " enables tabline

  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#branch#empty_message = 'Not in Git Repo'

  let g:airline_powerline_fonts = 1                                  " disabled cuz i dont have a patched font =(
  let g:airline_symbols.branch = ''                                 " git branch symbol!

  let g:airline#extensions#neomake#enabled = 1
" }}}

" Vim-Devicons -------------------------------------------------------------{{{

  " after a re-source, fix syntax matching issues (concealing brackets):
  if exists('g:loaded_webdevicons')
      call webdevicons#refresh()
  endif

  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''

" }}}

" Deoplete  ----------------------------------------------------------------{{{

  "start Deoplete always
  let g:deoplete#enable_at_startup = 1

  " use deoplete for .jsx
  let g:jsx_ext_required = 0

  autocmd CompleteDone * pclose
  let g:deoplete#file#enable_buffer_path=1

  " custom omni source markers
  call deoplete#custom#source('buffer', 'mark', 'ℬ')
  call deoplete#custom#source('ternjs', 'mark', '')
  call deoplete#custom#source('omni',   'mark', '⌾')
  call deoplete#custom#source('file',   'mark', 'file')

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

   " deoplete tab-complete
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  " jump to definition
  autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR> let g:tern#is_show_argument_hints_enabled = 1
  " jump to definition in new buffer
  autocmd FileType javascript nnoremap <silent> <buffer> gb! :TernDefSplit<CR>

" }}}

" Javascript ---------------------------------------------------------------{{{

  " dont care about elzr/vim-json quote conceal
  let g:vim_json_syntax_conceal = 0

  " let pangloss/js handle flow
  let g:javascript_plugin_flow = 1

" }}}

" Fold, gets it's own section  ---------------------------------------------{{{

function! MyFoldText() " {{{
  " Get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~? '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = ' ' . foldSize . ' lines '
  let foldLevelStr = repeat('+--', v:foldlevel)
  let lineCount = line('$')
  let foldPercentage = printf('[%.1f', (foldSize*1.0)/lineCount*100) . '%] '
  let expansionString = repeat('.', w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
  return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction " }}}

set foldtext=MyFoldText()

autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

autocmd FileType vim setlocal fdc=1
set foldlevel=99

" Space to toggle folds.
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0

autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99

autocmd FileType css,scss,json setlocal foldmethod=marker
autocmd FileType css,scss,json setlocal foldmarker={,}

autocmd FileType coffee setl foldmethod=indent
let g:xml_syntax_folding = 1
autocmd FileType xml setl foldmethod=syntax

autocmd FileType html setl foldmethod=expr
autocmd FileType html setl foldexpr=HTMLFolds()

autocmd FileType javascript,typescript,json,go,rust,ruby setl foldmethod=syntax

" }}}

" GitGutter ----------------------------------------------------------------{{{

  let g:gitgutter_enabled = 1

  let g:gitgutter_sign_added = '▎'
  let g:gitgutter_sign_modified = '▎'
  let g:gitgutter_sign_removed = '▏'
  let g:gitgutter_sign_removed_first_line = '▔'
  let g:gitgutter_sign_modified_removed = '▋'

  highlight clear SignColumn
  highlight! GitGutterAdd ctermfg=darkgreen guifg=darkgreen
  highlight! GitGutterChange ctermfg=yellow guifg=yellow
  highlight! GitGutterDelete ctermfg=darkred guifg=darkred
  highlight! GitGutterChangeDelete ctermfg=darkred guifg=darkred


  highlight GitGutterAdd ctermfg=green
  highlight GitGutterChange ctermfg=yellow
  highlight GitGutterDelete ctermfg=red
  highlight GitGutterChangeDelete ctermfg=yellow

  " }}}

" ALE ----------------------------------------------------------------------{{{

  let g:airline#extensions#ale#enabled = 1
  let g:ale_linters = {
        \  'jsx': ['eslint'],
        \  'javascript': ['eslint'],
        \  'ruby': ['rubocop']
        \ }
  let b:ale_fixers = {
        \'javascript': ['prettier', 'eslint']
        \}

"  }}}

" Polyglot -----------------------------------------------------------------{{{

  let g:polyglot_disabled = ['javascript', 'json', 'jsx']

" }}}

" Close-Tag ----------------------------------------------------------------{{{

  let g:closetag_filenames = '*.html,*.jsx,*.js,*.html.erb'

"}}}

" Easy Motion --------------------------------------------------------------{{{

  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_use_smartsign_us = 1
  let g:EasyMotion_do_mapping = 0
  let g:EasyMotion_prompt = '→ → →'

" }}}

" TMUX Navigator -----------------------------------------------------------{{{

  let g:tmux_navigator_disable_when_zoomed = 1                 " Disable tmux navigator when zooming the Vim pane

" }}}

" IndentGuides -------------------------------------------------------------{{{

  let g:indent_guides_color_change_percent = 1
  let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
  let g:indent_guides_enable_on_vim_startup = 1

"  }}}

" fzf (https://github.com/junegunn/fzf#as-vim-plugin)-----------------------{{{

  " set run time path of fzf install
  set rtp+=/usr/local/opt/fzf

  " enable <C-n>/<C-p> as tab thru previous fzf sessions
  let g:fzf_history_dir = '~/.local/share/fzf-history'

  " remove status line for FZF sessions
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" }}}
