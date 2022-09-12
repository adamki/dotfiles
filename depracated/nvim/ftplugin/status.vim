set laststatus=2

function! ActiveStatus()
  let statusline=""
  let statusline.="%1*"

  let statusline.="\ %<"
  let statusline.="%#MyStatuslineLineGrey#"
  let statusline.="%2*"
  let statusline.="%{FugitiveStatusline()!=''?'\ \ '.FugitiveStatusline().'\ ':'Not in a Repo'}"
  let statusline.="%#MyStatuslineLineGrey#"
  let statusline.="%1*"

  let statusline.="\ %<"
  let statusline.="%#MyStatuslineLineGrey#"
  let statusline.="%4*"
  let statusline.="%f"
  let statusline.="%6*"
  let statusline.="%{&modified?'\ \ ●':'   '}"
  let statusline.="%6*"
  let statusline.="%{&readonly?'\ \ ':''}"
  let statusline.="%#MyStatuslineLineGrey#"

  let statusline.="%="

  let statusline.="\ %#MyStatuslineLineGrey#"
  let statusline.="%3*"
  let statusline.="%l/%L(%c)"
  let statusline.="%#MyStatuslineLineGrey#"
  let statusline.="%1*"


  let statusline.="\ %#MyStatuslineLineGrey#"
  let statusline.="%5*"
  let statusline.="%{StatusDiagnostic()}"
  let statusline.="%#MyStatuslineLineGrey#"
  let statusline.="\ "
  return statusline
endfunction

function! InactiveStatus()
  let statusline=""

  let statusline.="%="
  let statusline.="%8*"
  let statusline.="\%f"
  let statusline.="%6*"
  let statusline.="%{&readonly?'\  ':''}"
  let statusline.="%{&modified?' \  ●' \: ''}"
  let statusline.="%="
  return statusline
endfunction

set statusline=%!ActiveStatus()

augroup status
  autocmd!
  autocmd WinEnter * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InactiveStatus()
augroup END
