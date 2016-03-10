set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize

call vundle#begin()
Plugin 'vundleVim/vundle.vim'     " let Vundle manage Vundle, REQUIRED
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'the-nerd-commenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'altercation/vim-colors-solarized'
Plugin 'raimondi/delimitMate'
Plugin 'isRuslan/vim-es6'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mustache/vim-mustache-handlebars'
" quick fix for YVM server failing/rashingwhen opening EMPTY js files. Please
" see https://github.com/Valloric/YouCompleteMe/issues/1018
Plugin 'ervandew/supertab'
Plugin 'valloric/youcompleteme'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'justinj/vim-react-snippets'
call vundle#end()                         " required
filetype plugin indent on                 " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""      VIMRC DIRECTORY     """"""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
" Leader Key
" AirLine config
" Colors
" Make VIM render faster
" Tabbing and Spacing
" CTRL P Config
" YouCompleteMe Config
" Hint to Keep lines short
" Trim Whitespace
" Vim Smooth Scroll

""""""""""""""""""""""""""""""""""" GENERAL """"""""""""""""""""""""""""""""
syntax enable
set clipboard=unnamed                   " use system clipboard
set encoding=utf-8                      " set char encoding to default to UTF-8
set nowrap                              " turn off line wrap
set relativenumber                      " Show relative line numbers
set nu                                  " Show actual number

"""""""""""""""""""""""""""""""""""" LEADER KEY """""""""""""""""""""""""""""""
let mapleader = "\<Space>"              " set the leader key to space

" bind TrimWhitespace() to Leader
noremap <Leader>w :call TrimWhitespace()<CR>
" bind Search/Replace to Leader
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
" bind nohl bound to leader
nnoremap <Leader><space> :nohlsearch<Bar>:echo<CR>

"""""""""""""""""""""""""""""""""""" AIRLINE CONFIG """""""""""""""""""""""""""
set laststatus=2                                   " always show status bar
set guifont=Source\ Code\ Pro\ for\ Powerline      " tells airline to use the proper font for special chars
let g:airline_theme = "powerlineish"
let g:airline_powerline_fonts = 1
let g:airline#extensions#ycm#enabled = 1
set ttimeoutlen=50                                 " get outta insert mode fast

"""""""""""""""""""""""""""""""""""" COLORS AND APPEARANCE """"""""""""""""""""
set t_Co=256                           " enable 256 colour pallet
"set cursorline                        " colours the line the cursor is on
"set cursorcolumn                      " colours the line the cursor is on
set vb                                 " enable visual bell (disable audio bell)
set list listchars=tab:→\ ,trail:·     " show extra white space

" Solarized.vim Color Config
let g:solarized_termcolors=256         " let iTerm render the correct solarized.vim colors
let g:solarized_termtrans = 1          " let iTerm transparency work with solarized.vim colors

set background=dark
colorscheme solarized

if exists('+colorcolumn')                              " hint to keep lines short
  set colorcolumn=80                                   " hint to keep lines short
  highlight ColorColumn ctermbg=DarkCyan               " make it dope
  highlight LineNr ctermfg=DarkCyan ctermbg=None
endif                                                  " hint to keep lines short

" Tell Vim to highlight EJS files just like Html
au BufNewFile,BufRead *.ejs set filetype=html

"""""""""""""""""""""""""""""""" MAKE VIM RENDER FASTER(er) """"""""""""""""""""
set synmaxcol=128                     " Only render 128 chars per line
set ttyfast                           " u got a fast terminal
set ttyscroll=3
set lazyredraw                        " to avoid scrolling problems

"""""""""""""""""""""""" TABBING AND SPACING """"""""""""""""""""""""""""""""""
set backspace=2                       " make backspace work like most other apps
set softtabstop=2
set expandtab
set showmatch                         " show bracket matches
set shiftwidth=2
set scrolloff=2                       " adds top/bottom buffer between cursor and window
set showcmd                           " display incomplete commands
set autoread                          " Auto-reload buffers when file changed on disk
set noshowmode                        " Get rid of default mode indicator
set autoindent                        " Set auto indent
set ts=2                              " Set indent to 2 spaces
set hlsearch                          " turn on highlight searching

""""""""""""""""""""  SYNTASTIC CONFIG   """""""""""""""""""""""""""""""""""""""
" Syntastic recommendations lines 119-126
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

" couple work-arounds to get jsx to lint properly with syntastic per this
" guy's instructions: https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

" tell syntastic to ignore warning for unused variables
let g:syntastic_quiet_messages = {'level': 'warnings'}

"""""""""""""""""""""""""  CTRL P CONFIG"""""""""""""""""""""""""""""""""""""
if executable('ag')                               " use AG over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

""""""""""""""""""  YouCompleteMe Config   """""""""""""""""""""""""""""""""""""
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

""""""""""""""""""""" VIM SMOOTH SCROLL ANIMATION  """""""""""""""""""""""""""""
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 35, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 35, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 35, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 35, 4)<CR>

"""""""""""""""""""""   MISC   """""""""""""""""""""""""""""""""""""""""""""""""
" Press Space to turn off search results and clear any message already displayed.

" set nerdtree toggle to Ctrl-n
map <C-n> :NERDTreeToggle<CR>

" set special key binding to allow DelimitMate split lines
imap <C-c> <CR><Esc>O

" Trim Whitespace
fun! TrimWhitespace()
  let l:save_cursor = getpos('.')
  %s/\s\+$//e
  call setpos('.', l:save_cursor)
endfunction

command! TrimWhitespace call TrimWhitespace()

" Omg, vim, Imma edit the same file multiple times, okay? fkn deal with it
" workround for .swo and swp files
set nobackup                             " no backup files
set nowritebackup                        " don't backup file while editing
set noswapfile                           " don't create swapfiles for new buffers
set updatecount=0                        " Don't try to write swapfiles after some number of updates
set backupskip=/tmp/*,/private/tmp/*"    " can edit crontab files
