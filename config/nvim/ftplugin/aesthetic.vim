set background=dark                               " must go before :colorscheme
colo gruvbox                                      " must go after set bg
let g:enable_italic_font = 1                      " Make sure to italicize

" STATUS BAR COLORS
let statuslinebasebg = '#3c3836' " gruvbox
" let statuslinebasebg = '#343945' " onedark
hi User1 guifg=grey guibg=NONE
exe 'hi User2 guifg=lightred guibg=' . statuslinebasebg
exe 'hi User3 guifg=lightblue guibg=' . statuslinebasebg
exe 'hi User4 guifg=lightyellow guibg=' . statuslinebasebg
exe 'hi User5 guifg=darkcyan guibg=' . statuslinebasebg
exe 'hi User6 guifg=lightgreen guibg=' . statuslinebasebg
exe 'hi User7 guifg=lightgreen guibg=NONE'

exe 'hi MyStatuslineLineGrey ctermfg=0 cterm=NONE ctermbg=NONE  guibg=NONE guifg=' . statuslinebasebg
