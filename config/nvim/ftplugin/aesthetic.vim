set background=dark                              " must go before :colorscheme
colo iceberg                                     " must go after set bg
let g:enable_italic_font = 1                     " Make sure to italicize
let g:nova_transparent = 1

function! Set_italics()
  hi htmlArg gui=italic
  hi Comment gui=italic
  hi Type    gui=italic

  hi htmlArg cterm=italic
  hi Comment cterm=italic
  hi Type    cterm=italic
endfunction
