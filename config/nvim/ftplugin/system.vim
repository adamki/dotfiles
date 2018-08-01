" neovim settings
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
tnoremap <Esc> <C-\><C-n>             " enable ESC behavior when in terminal emulator
set mouse=a                           " enable mouse mode
let $NVIM_TUI_ENABLE_TRUE_COLOR=1     " sets colors to be true
let mapleader = "\<space>"            " set dat leader
let maplocalleader=";"
set colorcolumn=80                    " keep lines short
set termguicolors                     " enable true colors

set clipboard+=unnamedplus            " visual copy works to native OS
set nopaste                           " but default to nopaste
set pastetoggle=<f6>                  " toggle paste/nopaste
set list                              " show white space
autocmd BufWritePre * %s/\s\+$//e     " remove unwanted space(s) on Buffer Pre-write
set noswapfile                        " do NOT create swapfiles for new buffers
filetype on                           " let vim detect fileType
set number relativenumber             " line numbers!
set numberwidth=3                     " make number gutter small
set tabstop=2 shiftwidth=2 expandtab  " better tabs and line shifts

au FileType python setl sw=2 sts=2 et
set virtualedit=                      " unset virtualedit
set wildmenu                          " better vim command completion
set laststatus=2                      " always show statusline in window
set nowrap                            " wrap lines at word
set wildmode=list:longest,full        " better vim command completion
set autoread                          " detect if file has changed
set undofile                          " enable persistant undo
set undodir=~/.config/nvim/UNDO_HISTORY      " undo hist save location
set splitbelow                        " Horizontal split below current.
set splitright                        " Vertical split to right of current.
set lazyredraw
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
