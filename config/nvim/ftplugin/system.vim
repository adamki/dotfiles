" neovim settings
syntax on                                " enable syntax
set encoding=utf8                        " Set encoding to UTF-8 to show glyphs
let $NVIM_TUI_ENABLE_TRUE_COLOR=1        " sets colors to be true
set termguicolors                        " enable true colors
let mapleader = "\<space>"               " <Leader>
let maplocalleader=";"                   " <LocalLeader>
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
tnoremap <Esc> <C-\><C-n>                " enable ESC behavior when in terminal emulator
set mouse=a                              " enable mouse mode
set colorcolumn=80                       " keep lines short
set clipboard+=unnamedplus               " visual copy works to native OS
set nopaste                              " but default to nopaste
set pastetoggle=<f6>                     " toggle paste/nopaste
set list                                 " show white space
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
set laststatus=2                         " always show statusline in window
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
" always place cursor at zz
autocmd BufRead * normal zz
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif " remember cursor position


" UPDATES TMUX STATUS-WINDOW WITH CURRENT FILE NAME
" BEWARE : May slow down buffer switching
" autocmd BufEnter,BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " .expand("%"))
" autocmd VimLeave * call system("tmux rename-window zsh")
set t_ts=^[]2;
set t_fs=^[\\
" Turn on setting the title.
set title
" The following causes vim to refresh the title each time we change buffers.
" Otherwise it will only set the title once at startup.
augroup RefreshTitle
  autocmd!
  " The concatenation of the colon is a hack to prevent vim from
  " interpreting the string as a modeline.
  autocmd BufEnter * let &titlestring = expand("%:p:t:h")
augroup END
