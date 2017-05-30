"   /   | ____/ /___ _____ ___ ( )_____
"  / /| |/ __  / __ `/ __ `__ \|// ___/
" / ___ / /_/ / /_/ / / / / / / (__  )
"/_/  |_\__,_/\__,_/_/ /_/ /_/ /____/
"======================================
"       ____  ___  ____ _   __(_)___ ___
"      / __ \/ _ \/ __ \ | / / / __ `__ \
"     / / / /  __/ /_/ / |/ / / / / / / /
"    /_/ /_/\___/\____/|___/_/_/ /_/ /_/
"  ========================================


" Setup dein  --------------------------------------------------------------{{{

  if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
    call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
  endif

  set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
  call dein#begin(expand('~/.config/nvim'))
  call dein#add('Shougo/dein.vim')
  " colors
  call dein#add('mhartington/oceanic-next')
  call dein#add('rakr/vim-one')
  call dein#add('morhetz/gruvbox')
  " Javascript
  " syntax
  call dein#add('othree/yajs')
  call dein#add('pangloss/vim-javascript')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('maxmellon/vim-jsx-pretty')
  call dein#add('elzr/vim-json')
  call dein#add('othree/javascript-libraries-syntax.vim')
  " Folding (see Fold Section)
  call dein#add('nelstrom/vim-markdown-folding', {'on_ft': 'markdown'})
  " vim extensions
  call dein#add('vim-airline/vim-airline')
  call dein#add('mhinz/vim-sayonara')
  call dein#add('tpope/vim-fugitive')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('neovim/node-host', {'build': 'npm install'})
  call dein#add('vimlab/mdown.vim', {'build': 'npm install'})
  call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
  call dein#add('christoomey/vim-tmux-navigator')
  if dein#check_install()
    call dein#install()
    let pluginsExist=1
  endif

  call dein#end()
  filetype plugin indent on

" }}}

" System Settings ----------------------------------------------------------{{{

  " neovim settings
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  let mapleader = ','                   " set dat leader
  set colorcolumn=80                    " keep lines short
  set termguicolors                     " enable true colors
  set clipboard+=unnamedplus            " visual copy works to native OS
  set nopaste                           " but default to nopaste
  set pastetoggle=<f6>                  " toggle paste/nopaste
  set list                              " show white space
  autocmd BufWritePre * %s/\s\+$//e     " remove unwanted space(s) on Buffer Pre-write
  set noswapfile                        " do NOT create swapfiles for new buffers
  filetype on                           " let vim detect fileType
  set number                            " line numbers!
  set numberwidth=1                     " make number gutter small
  set tabstop=2 shiftwidth=2 expandtab  " better tabs and line shifts
  set virtualedit=                      " unset virtualedit
  set wildmenu                          " better vim command completion
  set laststatus=2                      " always show statusline in window
  set wrap linebreak nolist             " wrap lines at word
  set wildmode=list:longest,full        " better vim command completion
  set autoread                          " detect if file has changed
  set undofile                          " enable persistant undo
  set undodir=~/.config/nvim/undo       " undo hist save location
  set splitbelow                        " Horizontal split below current.
  set splitright                        " Vertical split to right of current.
  if !&scrolloff
    set scrolloff=8                     " Show next 8 lines while scrolling.
  endif
  if !&sidescrolloff
    set sidescrolloff=8                 " Show next 8 columns while side-scrolling.
  endif
  "always place cursor at zz
  autocmd BufRead * normal zz
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif " remember cursor position


" }}}

" Key Mappings -------------------------------------------------------------{{{
  " no ex mode
  nnoremap Q <nop>
  nnoremap <Leader>w :w<CR>
  nnoremap <Leader>q :q<CR>
  nnoremap <Leader>Q :q!<CR>
  nnoremap <Leader>x :x<CR>
  " reload nvimrc
  nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>
  " copy current file path
  nmap cp :let @+= expand("%") <cr>
  noremap H ^
  noremap L g_
  nnoremap ; :
  " vim omnicomplete
  inoremap <C-f> <C-x><C-f>
  " better lateral block movement
  vmap < <gv
  vmap > >gv
  " turn off high-lighted search results
  nnoremap <silent> <esc> :noh<cr>
  nnoremap <Leader> <Space> :noh<cr>

" }}}

" Aesthetix ----------------------------------------------------------------{{{

  syntax on
  colorscheme OceanicNext
  let g:OceanicNext_italic = 1

" }}}

" Operator-Mono Italix -----------------------------------------------------{{{

  hi htmlArg gui=italic
  hi Comment gui=italic
  hi Type    gui=italic
  hi htmlArg cterm=italic
  hi Comment cterm=italic
  hi Type    cterm=italic

" }}}

" Javascript ---------------------------------------------------------------{{{

  let g:used_javascript_libs = 'underscore,backbone,lodash,react,require,jasmine, chai,handlebars,vue,d3,jQuery'

" }}}

" Fold, gets it's own section  ---------------------------------------------{{{

  function! MyFoldText() " {{{
      let line = getline(v:foldstart)
      let nucolwidth = &fdc + &number * &numberwidth
      let windowwidth = winwidth(0) - nucolwidth - 3
      let foldedlinecount = v:foldend - v:foldstart

      " expand tabs into spaces
      let onetab = strpart('          ', 0, &tabstop)
      let line = substitute(line, '\t', onetab, 'g')

      let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
      " let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - len('lines')
      " let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - len('lines   ')
      let fillcharcount = windowwidth - len(line)
      " return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . ' Lines'
      return line . '…' . repeat(" ",fillcharcount)
  endfunction " }}}

  set foldtext=MyFoldText()

  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

  autocmd FileType vim setlocal fdc=1
  set foldlevel=99

  " Space to toggle folds.
  nnoremap <Space> za
  vnoremap <Space> za
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

  autocmd FileType javascript,typescript,json setl foldmethod=syntax

" }}}

" Airline Config------------------------------------------------------------{{{

  set noshowmode                                                       " hide vim's mode status
  set hidden                                                           " hide buffers instead of unload them
  cnoreabbrev <silent> <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif                                                                " set up symbol dictionary
  let g:airline#extensions#tabline#enabled = 1                         " enables tabline
  let g:airline_theme='oceanicnext'                                    " set airline theme
  let g:airline#extensions#tabline#fnamemod = ':t'                     " display tail of file name in tabs
  let g:airline#extensions#tabline#buffer_idx_mode = 1                 " enable buffer indices
  let g:airline#extensions#neomake#error_symbol='• '
  let g:airline#extensions#neomake#warning_symbol='•  '
  let g:airline_powerline_fonts = 1
  let g:airline_symbols.branch = ''                                   " git branch symbol!
  nmap <leader>, :bnext<CR>                                            " tab next
  nmap <leader>. :bprev<CR>                                            " tab prev
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
  let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '0 ',
        \ '1': '1 ',
        \ '2': '2 ',
        \ '3': '3 ',
        \ '4': '4 ',
        \ '5': '5 ',
        \ '6': '6 ',
        \ '7': '7 ',
        \ '8': '8 ',
        \ '9': '9 ',
        \}                                                             " make tab indices look normal
" }}}

" Vim-Devicons -------------------------------------------------------------{{{

  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''

" }}}

" Navigate between vim buffers and tmux panels -----------------------------{{{

  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
  nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
  nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>

"}}}

" Markdown preview ---------------------------------------------------------{{{
  nmap <Leader>md :Mpreview<CR>
" }}}

" FZF-VIM ------------------------------------------------------------------{{{
  "
  " nmap <C-p> :Files<CR>
  " let g:fzf_layout = {'up': '~25%'}

" }}}

