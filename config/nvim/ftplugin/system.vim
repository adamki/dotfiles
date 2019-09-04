" neovim settings
syntax on                                " enable syntax
set encoding=utf8                        " Set encoding to UTF-8 to show glyphs
let $NVIM_TUI_ENABLE_TRUE_COLOR=1        " sets colors to be true
set termguicolors                        " enable true colors
let mapleader = "\<space>"               " <Leader>
let maplocalleader=";"                   " <LocalLeader>
set mouse=a                              " enable mouse mode
set colorcolumn=80                       " keep lines short
set clipboard=unnamedplus
set nopaste                              " but default to nopaste
set pastetoggle=<f6>                     " toggle paste/nopaste
autocmd BufWritePre * %s/\s\+$//e        " remove unwanted space(s) on Buffer Pre-write
set noswapfile                           " do NOT create swapfiles for new buffers
filetype on                              " let vim detect fileType
set number                               " line numbers!
set numberwidth=3                        " make number gutter small
set tabstop=2 shiftwidth=2 expandtab     " better tabs and line shifts
set noshowmode                           " hide vim's mode status
set hidden                               " hide buffers instead of unload them
set virtualedit=                         " unset virtualedit
set wildmenu                             " better vim command completion
set laststatus=2                         " 0 = never, 1 = only when more than one, 2 = always
set nowrap                               " wrap lines at word
set wildmode=list:longest,full           " better vim command completion
set autoread                             " detect if file has changed

set undofile                             " enable persistant undo
set undodir=~/.config/nvim/UNDO_HISTORY  " undo hist save location

set splitbelow                           " Horizontal split below current.
set splitright                           " Vertical split to right of current.
set ttyfast lazyredraw
if !&scrolloff
  set scrolloff=8                        " Show next 8 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=8                    " Show next 8 columns while side-scrolling.
endif
autocmd BufWinEnter,WinEnter term://* startinsert "automatically use insert mode when entering a term pane
" always place cursor at zz
autocmd BufRead * normal zz
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif " remember cursor position

" COC.nvim based settings
set nobackup                             " Some servers have issues with backup files, see #649
set nowritebackup                        " Some servers have issues with backup files, see #649
set cmdheight=2                          " Better display for messages
set updatetime=300                       " You will have bad experience for diagnostic messages when it's default 4000.
set shortmess+=c                         " don't give |ins-completion-menu| messages.
set signcolumn=yes                       " always show signcolumns

