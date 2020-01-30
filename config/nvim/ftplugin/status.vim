set laststatus=2

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
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
  let statusline.="%1*"
  let statusline.="\ %{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}"
  let statusline.="%2*"
  let statusline.="\ %<"
  let statusline.="%f"
  let statusline.="%3*"
  let statusline.="%{&modified?'\ \ ●':''}"
  let statusline.="%2*"
  let statusline.="%{&readonly?'\ \ ':''}"
  let statusline.="%="
  let statusline.="%1*"
  let statusline.="%{StatusDiagnostic()} \ "
  let statusline.="%2*"
  let statusline.="%l/%L"
  return statusline
endfunction

function! InactiveStatus()
  let statusline=""
  let statusline.="%f"
  let statusline.="%{&readonly?'\  ':''}"
  let statusline.="%3*"
  let statusline.="%{&modified?'\ \ ●':''}"
  let statusline.="%="
  let statusline.="%1*"
  return statusline
endfunction

set statusline=%!ActiveStatus()
hi User1 guibg=NONE guifg=lightred
hi User2 guibg=NONE guifg=grey
hi User3 guibg=NONE guifg=lightgreen

augroup status
  autocmd!
  autocmd WinEnter * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InactiveStatus()
augroup END

