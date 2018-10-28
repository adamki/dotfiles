let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 25
let g:NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeRespectWildIgnore = 0
let g:NERDTreeAutoDeleteBuffer = 0
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeHijackNetrw = 1
let NERDTreeShowBookmarks=1
" let g:NERDTreeBookmarksFile = $VARPATH.'/treemarks'
let NERDTreeIgnore = [
      \ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.svn$',
      \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.cache$'
      \ ]
let g:NERDTreeMapOpenSplit = 'sv'
let g:NERDTreeMapOpenVSplit = 'sg'
let g:NERDTreeMapOpenInTab = 'st'
let g:NERDTreeMapOpenInTabSilent = 'sT'
let g:NERDTreeMapUpdirKeepOpen = '<BS>'
let g:NERDTreeMapOpenRecursively = 't'
let g:NERDTreeMapCloseChildren = 'T'
let g:NERDTreeMapToggleHidden = '.'
