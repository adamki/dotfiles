" Aesthetix ----------------------------------------------------------------{{{

  syntax on                                       " enable syntax
  set background=dark                             " must go before :colorscheme
  let g:nord_comment_brightness = 20              " bright comments. (1 - 20)
  colorscheme nova                     " must go after set bg
  let g:enable_italic_font = 1                    " Make sure to italicize
  " let g:indentLine_char = '| '                  " line indent icon
  " highlight LineNr ctermfg=grey ctermbg=white
  set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20

  let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : '#(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD)',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    : '#(date)',
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

" }}}
