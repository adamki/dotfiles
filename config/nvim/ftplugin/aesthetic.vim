set background=dark                               " must go before :colorscheme
colo gruvbox8_hard                                     " must go after set bg
let g:enable_italic_font = 1                      " Make sure to italicize

" STATUS BAR COLORS
let statuslinebasebg = '#3c3836' " gruvbox
" let statuslinebasebg = '#343945' " onedark

exe 'hi User1 guifg=grey guibg=NONE'
exe 'hi User2 guifg=lightred guibg=' . statuslinebasebg
exe 'hi User3 guifg=lightblue guibg=' . statuslinebasebg
exe 'hi User4 guifg=slate guibg=' . statuslinebasebg
exe 'hi User5 guifg=darkcyan guibg=' . statuslinebasebg
exe 'hi User6 guifg=lightgreen guibg=' . statuslinebasebg

exe 'hi User7 guifg=darkgray guibg=NONE'
exe 'hi User8 guifg=darkgray guibg=' . statuslinebasebg

exe 'hi MyStatuslineLineGrey ctermfg=0 cterm=NONE ctermbg=NONE  guibg=NONE guifg=' . statuslinebasebg
