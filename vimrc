set nocompatible                         " use Vim over Vi
set number                               " line nums

" Omg, vim, Imma edit the same file multiple times, okay? fkn deal with it workround for .swo and swp files
set nobackup                             " no backup files
set nowritebackup                        " don't backup file while editing
set noswapfile                           " don't create swapfiles for new buffers
set updatecount=0                        " Don't try to write swapfiles after some number of updates

set backspace=indent,eol,start           " Make backspace behave in a sane manner.
