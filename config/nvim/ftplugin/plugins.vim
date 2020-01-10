" itchyny/lightline -------------------{{{
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'active': {
      \   'left': [ [ 'paste', 'modified' ],
      \             [ 'gitbranch', 'fugitive' ],
      \             [ 'readonly', 'filename',  'modified']],
      \   'right': [ [ 'cocstatus', 'currentfunction' ],
      \              [ 'lineinfo']]
      \ },
      \ 'inactive': {
      \    'left': [ [ 'none' ], [ 'relativepath', 'modified' ]],
      \    'right': [ [] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
			\   'fugitive': 'LightlineFugitive'
      \ },
      \ }

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
" }}}

" alvan/vim-closetag ------------------{{{
let g:closetag_filenames = '*.html,*.jsx,*.js,*.tsx,*.html.erb'          " close tags on these files
" }}}

" shime/vim-livedown ------------------{{{
let g:livedown_autorun = 1                                          " automatically launch new browser/preview
let g:livedown_open = 1                                             " browser automatically opens window upon previewing
" }}}

" easymotion/vim-easymotion -----------{{{
let g:EasyMotion_smartcase = 1                                     " match upper and lower case
let g:EasyMotion_use_smartsign_us = 1                              " match smart chars
" }}}

" junegunn/fzf.vim --------------------{{{
let g:fzf_history_dir = '~/.local/share/fzf-history'               " enable <C-n>/<C-p> as tab thru previous fzf sessions

" let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
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
endfunction
" }}}

" pbogut/fzf-mru ----------------------{{{
let g:fzf_mru_relative = 1
" }}}

" neoclide/coc.vim --------------------{{{
let g:coc_global_extensions = [
  \'coc-git',
  \'coc-vimlsp',
  \'coc-eslint',
  \'coc-yank',
  \'coc-json',
  \'coc-tsserver',
  \'coc-html',
  \'coc-css',
  \'coc-highlight',
  \]

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" }}}

" Yggdroot/indentLine -----------------{{{
let g:indentLine_fileTypeExclude = ['coc-explorer']
"}}}
