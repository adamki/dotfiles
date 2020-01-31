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
    else
      echo 'Set colorscheme to '.&background.' mode'
    endif
  endif
  call Set_italics()
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

