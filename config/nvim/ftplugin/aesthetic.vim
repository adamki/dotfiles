set background=dark                              " must go before :colorscheme
colo night-owl                                     " must go after set bg
let g:enable_italic_font = 1                     " Make sure to italicize

function! Set_italics()
  hi htmlArg gui=italic
  hi Comment gui=italic
  hi Type    gui=italic

  hi htmlArg cterm=italic
  hi Comment cterm=italic
  hi Type    cterm=italic
endfunction

let g:airline_theme='night_owl'                     " Airline theme

let g:airline_left_sep ='▛'
let g:airline_right_sep = '▞'

let g:airline#extensions#tabline#left_sep = '▛'
let g:airline#extensions#tabline#right_sep = '▞'
