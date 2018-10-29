set nocompatible              " be iMproved, required
filetype off                  " required

" Omg, vim, Imma edit the same file multiple times, okay? fkn deal with it workround for .swo and swp files
set nobackup                             " no backup files
set nowritebackup                        " don't backup file while editing
set noswapfile                           " don't create swapfiles for new buffers
set updatecount=0                        " Don't try to write swapfiles after some number of updates
set backupskip=/tmp/*,/private/tmp/*"    " can edit crontab files
