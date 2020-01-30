set laststatus=2

function! StatusDiagnostic() abort
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
endfunction

function! ActiveStatus()
  let statusline=""
  let statusline.="%2*"
  let statusline.="\ %<"
  let statusline.="\ %#MyStatuslineLineCol#"
  let statusline.="%1*"
  let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':'Not in a Repo'}"
  let statusline.="%#MyStatuslineLineCol#"
  let statusline.="%2*"
  let statusline.="\ %<"
  let statusline.="\ %#MyStatuslineLineTest#"
  let statusline.="%4*"
  let statusline.="%f"
  let statusline.="%3*"
  let statusline.="%{&modified?'\ \ ●':''}"
  let statusline.="%3*"
  let statusline.="%{&readonly?'\ \ ':''}"
  let statusline.="%#MyStatuslineLineTest#"
  let statusline.="%="
  let statusline.="%2*"
  let statusline.="%l/%L"
  let statusline.="\ %#MyStatuslineLineCol#"
  let statusline.="%1*"
  let statusline.="%{StatusDiagnostic()}"
  let statusline.="%#MyStatuslineLineCol#"
  return statusline
endfunction

function! InactiveStatus()
  let statusline=""
  let statusline.="%2*"
  let statusline.="\    %f"
  let statusline.="%{&readonly?'\  ':''}"
  let statusline.="%5*"

  let statusline.="%{&modified?'\ \ ●':''}"
  return statusline
endfunction

set statusline=%!ActiveStatus()
hi User1 guibg=lightred guifg=black
hi User2 guibg=NONE guifg=grey
hi User3 guibg=grey guifg=lightgreen
hi User4 guibg=grey guifg=black
hi User5 guibg=NONE guifg=lightgreen

hi MyStatuslineLineCol ctermfg=0 cterm=NONE ctermbg=NONE guifg=lightred guibg=None

hi MyStatuslineLineTest ctermfg=0 cterm=NONE ctermbg=NONE guifg=grey guibg=NONE

augroup status
  autocmd!
  autocmd WinEnter * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InactiveStatus()
augroup END

