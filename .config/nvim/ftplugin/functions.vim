function! Toggle_background() " Toggle_background {{{
  if ! exists('g:colors_name')
    echomsg 'No colorscheme set'
    return
  endif
  let l:scheme = g:colors_name
  if l:scheme =~# 'dark' || l:scheme =~# 'light'
    " Rotate between different theme backgrounds
    execute 'colorscheme' (l:scheme =~# 'dark'
          \ ? substitute(l:scheme, 'dark', 'light', '')
          \ : substitute(l:scheme, 'light', 'dark', ''))
  else
    execute 'set background='.(&background ==# 'dark' ? 'light' : 'dark')
    if ! exists('g:colors_name')
      execute 'colorscheme' l:scheme
      echomsg 'The colorscheme `'.l:scheme
            \ .'` doesn''t have background variants!'
    els
      echo 'Set' l:scheme 'to '.&background.' mode'
    endif
  endif
  call Set_italics()
  call Set_status_bar_colors()
endfunction "}}}

function! Toggle_number() " Toggle_number {{{
  if(&relativenumber == 1)
    set norelativenumber number
    autocmd BufEnter,FocusGained,InsertLeave * set norelativenumber number
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber number
  else
    set relativenumber number
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber number
    autocmd BufLeave,FocusLost,InsertEnter   * set relativenumber number
  endif
endfunc "}}}

function! Set_italics() " Set_italics {{{
  hi htmlArg gui=italic
  hi Comment gui=italic
  hi Type    gui=italic

  hi htmlArg cterm=italic
  hi Comment cterm=italic
  hi Type    cterm=italic
endfunction "}}}

function! Set_transparency() " Set_transparency {{{
  hi clear CursorLineNR
  hi SignColumn guibg=none
  hi Normal ctermbg=none guibg=none
  hi LineNr guibg=none ctermbg=none
  hi FoldColumn guibg=none
  hi VertSplit guibg=none ctermbg=none
endfunction " }}}

function! MyFoldText() "MyFoldText {{{
  " Get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~? '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = ' ' . foldSize . ' lines '
  let foldLevelStr = repeat('+--', v:foldlevel)
  let lineCount = line('$')
  let foldPercentage = printf('[%.1f', (foldSize*1.0)/lineCount*100) . '%] '
  let expansionString = repeat('.', w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
  return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endfunction " }}}

function! StatusDiagnostic() abort " StatusDiagnostic {{{
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return 'Clean' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction "}}}

function! Show_documentation() " Show_documentation {{{
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction "}}}

function! Select_current_word() " Select_current_word {{{
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc " }}}

function! FloatingFZF() " FloatingFZF {{{
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Normal
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction " }}}

function! Set_status_bar_colors()
  if &background ==# 'dark'
  " let statuslinebasebg = '#343945' " onedark
    let $BAT_THEME = 'OneHalfDark'
    let statuslinebasebg = '#3c3836' " gruvbox
    exe 'hi User1 guifg=grey guibg=NONE'
    exe 'hi User2 guifg=lightred guibg=' . statuslinebasebg
    exe 'hi User3 guifg=lightblue guibg=' . statuslinebasebg
    exe 'hi User4 guifg=slate guibg=' . statuslinebasebg
    exe 'hi User5 guifg=darkcyan guibg=' . statuslinebasebg
    exe 'hi User6 guifg=lightgreen guibg=' . statuslinebasebg

    exe 'hi User7 guifg=darkgray guibg=NONE'
    exe 'hi User8 guifg=darkgray guibg=' . statuslinebasebg

    exe 'hi MyStatuslineLineGrey ctermfg=0 cterm=NONE ctermbg=NONE  guibg=NONE guifg=' . statuslinebasebg
  endif
  if &background ==# 'light'
    let statuslinebasebg = '#ebdbb2' " gruvbox
    let $BAT_THEME = 'OneHalfLight'
    exe 'hi User1 guifg=darkgrey guibg=NONE'
    exe 'hi User2 guifg=darkred guibg=' . statuslinebasebg
    exe 'hi User3 guifg=darkblue guibg=' . statuslinebasebg
    exe 'hi User4 guifg=slate guibg=' . statuslinebasebg
    exe 'hi User5 guifg=darkcyan guibg=' . statuslinebasebg
    exe 'hi User6 guifg=red guibg=' . statuslinebasebg

    exe 'hi User7 guifg=darkgray guibg=NONE'
    exe 'hi User8 guifg=darkgray guibg=' . statuslinebasebg

    exe 'hi MyStatuslineLineGrey ctermfg=0 cterm=NONE ctermbg=NONE  guibg=NONE guifg=' . statuslinebasebg
  endif
endfunction
