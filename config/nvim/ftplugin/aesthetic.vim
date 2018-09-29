syntax on                                       " enable syntax
set background=dark                             " must go before :colorscheme
let g:nord_comment_brightness = 20              " bright comments. (1 - 20)
colo one                                        " must go after set bg
let g:enable_italic_font = 1                    " Make sure to italicize

" transparent guiBG
highlight Normal guibg=none
highlight NonText guibg=none

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : '#(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD)',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    : '#(date)',
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}
