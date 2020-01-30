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
  let statusline.="\ %#MyStatuslineLineCol#"
  let statusline.="%1*"
  let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}"
  let statusline.="%#MyStatuslineLineCol#"
  let statusline.="%2*"
  let statusline.="\ %<"
  let statusline.="%f"
  let statusline.="%3*"
  let statusline.="%{&modified?'\ \ ●':''}"
  let statusline.="%2*"
  let statusline.="%{&readonly?'\ \ ':''}"
  let statusline.="%="
  let statusline.="%2*"
  let statusline.="%l/%L"
  let statusline.="\ %#MyStatuslineLineCol#"
  let statusline.="%1*"
  let statusline.="%{StatusDiagnostic()} \ "
  let statusline.="%#MyStatuslineLineCol#"
  return statusline
endfunction

function! InactiveStatus()
  let statusline=""
  let statusline.="\    %f"
  let statusline.="%{&readonly?'\  ':''}"
  let statusline.="%3*"
  let statusline.="%{&modified?'\ \ ●':''}"
  return statusline
endfunction

set statusline=%!ActiveStatus()
hi User1 guibg=lightred guifg=black
hi User2 guibg=NONE guifg=grey
hi User3 guibg=NONE guifg=lightgreen

hi MyStatuslineLineCol ctermfg=0 cterm=NONE ctermbg=NONE guifg=lightred guibg=None

augroup status
  autocmd!
  autocmd WinEnter * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InactiveStatus()
augroup END

