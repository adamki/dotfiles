set background=dark                               " must go before :colorscheme
colo onedark                                       " must go after set bg
let g:enable_italic_font = 1                      " Make sure to italicize
" let g:nova_transparent = 1

" au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

function! Set_italics()
  hi htmlArg gui=italic
  hi Comment gui=italic
  hi Type    gui=italic

  hi htmlArg cterm=italic
  hi Comment cterm=italic
  hi Type    cterm=italic
endfunction

function! Set_transparency()
  hi clear CursorLineNR
  hi SignColumn guibg=none
  hi Normal ctermbg=none guibg=none
  " hi GitGutterAdd guibg=none guifg=green
  " hi GitGutterChange guibg=none guifg=yellow
  " hi GitGutterDelete guibg=none guifg=red
  " hi GitGutterChangeDelete guibg=none guifg=red
  hi LineNr guibg=none ctermbg=none
  hi FoldColumn guibg=none
  hi VertSplit guibg=none ctermbg=none
endfunction
