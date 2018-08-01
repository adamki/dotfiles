"     █████╗ ██████╗  █████╗ ███╗   ███╗ █╗ ███████╗
"    ██╔══██╗██╔══██╗██╔══██╗████╗ ████ ╚═╝ ██╔════╝
"    ███████║██║  ██║███████║██╔████╔██║    ███████╗
"    ██╔══██║██║  ██║██╔══██║██║╚██╔╝██║    ╚════██║
"    ██║  ██║██████╔╝██║  ██║██║ ╚═╝ ██║    ███████║
"    ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝    ╚══════╝
"                        ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
"                        ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
"                        ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
"                        ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
"                        ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
"                        ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

" Setup Plug  --------------------------------------------------------------{{{

  call plug#begin('~/.local/share/nvim/plugged')
  " appearance - search - syntax - italix

  " colors
  Plug 'chriskempson/base16-vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'trevordmiller/nova-vim'
  Plug 'zeis/vim-kolor'

  " syntax
  Plug 'sheerun/vim-polyglot'
  " Plug 'othree/yajs'
  " Plug 'othree/es.next.syntax.vim'
  " Plug 'jelera/vim-javascript-syntax'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'
  Plug 'elzr/vim-json'
  Plug 'othree/javascript-libraries-syntax.vim'

  " Folding (see fold section)
  Plug 'nelstrom/vim-markdown-folding', {'for': 'markdown'}

  " improve Vim interface
  Plug 'rhysd/accelerated-jk'

  " vim extensions
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'mhinz/vim-sayonara'
  Plug 'jreybert/vimagit', {'on': ['Magit', 'MagitOnly']}
  Plug 'ryanoasis/vim-devicons'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-markdown', {'for': 'markdown'}
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tpope/vim-eunuch'
  Plug 'airblade/vim-gitgutter'
  Plug 'shime/vim-livedown'
  Plug 'easymotion/vim-easymotion'

  " IDE level enhancements
  Plug 'shougo/denite.nvim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
  Plug 'neomake/neomake'
  Plug 'benjie/neomake-local-eslint.vim'
  Plug 'jaawerth/neomake-local-eslint-first'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'alvan/vim-closetag'
  Plug 'rking/ag.vim'

  "
  Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
  Plug 'junegunn/limelight.vim', {'on': 'Goyo'}
  Plug 'terryma/vim-expand-region'
  Plug 'nathanaelkane/vim-indent-guides'

  call plug#end()

" }}}

" ftplugin imports ---------------------------------------------------------{{{

  source ~/.config/nvim/ftplugin/aesthetic.vim
  source ~/.config/nvim/ftplugin/system.vim
  source ~/.config/nvim/ftplugin/keymappings.vim
  source ~/.config/nvim/ftplugin/nerdtree.vim

"  }}}

" MarkDown Live Previews ---------------------------------------------------{{{

  " should markdown preview get shown automatically upon opening markdown buffer
  let g:livedown_autorun = 1

  " should the browser window pop-up upon previewing
  let g:livedown_open = 1

" }}}

" Airline/TABS Config-------------------------------------------------------{{{

  let g:airline_theme='nova'
  " allow TAB to toggle tabs
  nmap <Tab> <C-w>w
  nmap <S-Tab> <C-w>W
  cnoreabbrev <silent> <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
  nnoremap tj  :tabnext<CR>
  nnoremap tk  :tabprev<CR>

  set noshowmode                                                       " hide vim's mode status
  set hidden                                                           " hide buffers instead of unload them
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif                                                                " set up symbol dictionary
  let g:airline#extensions#tabline#enabled = 1                         " enables tabline
  let g:airline#extensions#tabline#buffer_idx_mode = 1                 " enable buffer indices
  let g:airline#extensions#neomake#error_symbol='E: '                   " neomake lint(error)

  let g:airline#extensions#neomake#warning_symbol='W:  '                " neomake lint(error)
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'  " show abbreviated filepath

  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#branch#empty_message = 'No Repo Found'

  " let g:airline_powerline_fonts = 1                                  " disabled cuz i dont have a patched font =(
  " let g:airline_symbols.branch = ''                                 " git branch symbol!

  let g:airline#extensions#neomake#enabled = 1

  " tab shortcuts ----------------------------------------------------------{{{

  let g:airline_left_sep ='▛ '
  let g:airline_right_sep = '▞'

  let g:airline#extensions#tabline#left_sep = '▛ '
  let g:airline#extensions#tabline#right_sep = '▞'

  let g:airline_section_a = airline#section#create([''])
  let g:airline_section_x = airline#section#create([''])
  let g:airline_section_y = airline#section#create([''])

    nmap <leader>T :tabnew<CR>
    nmap ]b :bnext<CR>
    nmap [b :bprev<CR>
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    let g:airline#extensions#tabline#buffer_idx_format = {
          \ '0': '0 ',
          \ '1': '1 ',
          \ '2': '2 ',
          \ '3': '3 ',
          \ '4': '4 ',
          \ '5': '5 ',
          \ '6': '6 ',
          \ '7': '7 ',
          \ '8': '8 ',
          \ '9': '9 ',
          \}                                                             " make tab indices look normal

  "  }}}
" }}}

" Vim-Devicons -------------------------------------------------------------{{{

  " after a re-source, fix syntax matching issues (concealing brackets):
  if exists('g:loaded_webdevicons')
      call webdevicons#refresh()
  endif

  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''

" }}}

" Denite -------------------------------------------------------------------{{{

  call denite#custom#option('_', {
    \ 'prompt': 'λ:',
    \ 'empty': 0,
    \ 'winheight': 16,
    \ 'source_names': 'short',
    \ 'vertical_preview': 1,
    \ 'auto-accel': 1,
    \ 'auto-resume': 1,
    \ })

  call denite#custom#option('list', {})

  " MATCHERS

  " Default is 'matcher_fuzzy'
  call denite#custom#source('tag', 'matchers', ['matcher_substring'])
  if has('nvim') && &runtimepath =~# '\/cpsm'
   call denite#custom#source(
    \ 'buffer,file_mru,file_old,file_rec,grep,mpc,line',
    \ 'matchers', ['matcher_cpsm', 'matcher_fuzzy'])
  endif

  " SORTERS
  " Default is 'sorter_rank'
  call denite#custom#source('z', 'sorters', ['sorter_z'])

  " CONVERTERS
  " Default is none
  call denite#custom#source(
        \ 'buffer,file_mru,file_old',
        \ 'converters', ['converter_relative_word'])

  " FIND and GREP COMMANDS
  if executable('ag')
    " The Silver Searcher
    call denite#custom#var('file_rec', 'command',
          \ ['ag', '-U', '--hidden', '--follow', '--nocolor', '--nogroup', '-g', ''])

    " Setup ignore patterns in your .agignore file!
    " https://github.com/ggreer/the_silver_searcher/wiki/Advanced-Usage

    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('grep', 'default_opts',
          \ [ '--skip-vcs-ignores', '--vimgrep', '--smart-case', '--hidden' ])

  elseif executable('ack')
    " Ack command
    call denite#custom#var('grep', 'command', ['ack'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--match'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('grep', 'default_opts',
         \ ['--ackrc', $HOME.'/.config/ackrc', '-H',
         \ '--nopager', '--nocolor', '--nogroup', '--column'])
  endif

  " KEY MAPPINGS
  let insert_mode_mappings = [
        \  ['jj', '<denite:enter_mode:normal>', 'noremap'],
        \  ['<Esc>', '<denite:enter_mode:normal>', 'noremap'],
        \  ['<C-N>', '<denite:assign_next_matched_text>', 'noremap'],
        \  ['<C-P>', '<denite:assign_previous_matched_text>', 'noremap'],
        \  ['<Up>', '<denite:assign_previous_text>', 'noremap'],
        \  ['<Down>', '<denite:assign_next_text>', 'noremap'],
        \  ['<C-Y>', '<denite:redraw>', 'noremap'],
        \ ]

  let normal_mode_mappings = [
        \   ["'", '<denite:toggle_select_down>', 'noremap'],
        \   ['<C-n>', '<denite:jump_to_next_source>', 'noremap'],
        \   ['<C-p>', '<denite:jump_to_previous_source>', 'noremap'],
        \   ['gg', '<denite:move_to_first_line>', 'noremap'],
        \   ['st', '<denite:do_action:tabopen>', 'noremap'],
        \   ['sg', '<denite:do_action:vsplit>', 'noremap'],
        \   ['sv', '<denite:do_action:split>', 'noremap'],
        \   ['sc', '<denite:quit>', 'noremap'],
        \   ['r', '<denite:redraw>', 'noremap'],
        \ ]

  for m in insert_mode_mappings
    call denite#custom#map('insert', m[0], m[1], m[2])
  endfor

  for m in normal_mode_mappings
    call denite#custom#map('normal', m[0], m[1], m[2])
  endfor

  nnoremap <silent><LocalLeader>r :<C-u>Denite -resume -refresh<CR>
  nnoremap <silent><LocalLeader>f :<C-u>Denite file_rec<CR>
  nnoremap <silent><LocalLeader>b :<C-u>Denite buffer file_old -default-action=switch<CR>
  nnoremap <silent><LocalLeader>d :<C-u>Denite directory_rec -default-action=cd<CR>
  nnoremap <silent><LocalLeader>v :<C-u>Denite register -buffer-name=register<CR>
  xnoremap <silent><LocalLeader>v :<C-u>Denite register -buffer-name=register -default-action=replace<CR>
  nnoremap <silent><LocalLeader>l :<C-u>Denite location_list -buffer-name=list<CR>
  nnoremap <silent><LocalLeader>q :<C-u>Denite quickfix -buffer-name=list<CR>
  nnoremap <silent><LocalLeader>g :<C-u>Denite grep<CR>
  nnoremap <silent><LocalLeader>j :<C-u>Denite jump change file_point<CR>
  nnoremap <silent><LocalLeader>o :<C-u>Denite outline<CR>
  nnoremap <silent><LocalLeader>s :<C-u>Denite session -buffer-name=list<CR>
  nnoremap <silent><expr> <LocalLeader>t &filetype == 'help' ? "g\<C-]>" :
        \ ":\<C-u>DeniteCursorWord -buffer-name=tag
        \  tag:include\<CR>"
  nnoremap <silent><expr> <LocalLeader>p  &filetype == 'help' ?
        \ ":\<C-u>pop\<CR>" : ":\<C-u>Denite -mode=normal jump\<CR>"
  nnoremap <silent><LocalLeader>h :<C-u>Denite help<CR>
  "  nnoremap <silent><LocalLeader>m :<C-u>Denite mpc -buffer-name=mpc<CR>
  nnoremap <silent><LocalLeader>/ :<C-u>Denite line<CR>
  nnoremap <silent><LocalLeader>* :<C-u>DeniteCursorWord line<CR>
  nnoremap <silent><LocalLeader>z :<C-u>Denite z<CR>
  nnoremap <silent><LocalLeader>; :<C-u>Denite command command_history<CR>

  " chemzqm/denite-git
  nnoremap <silent> <Leader>gl :<C-u>Denite gitlog:all<CR>
  nnoremap <silent> <Leader>gs :<C-u>Denite gitstatus<CR>
  nnoremap <silent> <Leader>gc :<C-u>Denite gitbranch<CR>

  " Open Denite with word under cursor or selection
  nnoremap <silent> <Leader>gf :DeniteCursorWord file_rec<CR>
  nnoremap <silent> <Leader>gg :DeniteCursorWord grep<CR>
  vnoremap <silent> <Leader>gg
    \ :<C-u>call <SID>get_selection('/')<CR>
    \ :execute 'Denite grep:::'.@/<CR><CR>

  function! s:get_selection(cmdtype)
    let temp = @s
    normal! gv"sy
    let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
    let @s = temp
  endfunction

"}}}

" Deoplete  ----------------------------------------------------------------{{{

  "start Deoplete always
  let g:deoplete#enable_at_startup = 1

  " use deoplete for .jsx
  let g:jsx_ext_required = 0

  autocmd CompleteDone * pclose
  let g:deoplete#file#enable_buffer_path=1

  " custom omni source markers
  call deoplete#custom#source('buffer', 'mark', 'ℬ')
  call deoplete#custom#source('ternjs', 'mark', '')
  call deoplete#custom#source('omni', 'mark', '⌾')
  call deoplete#custom#source('file', 'mark', 'file')

  " let carlitux Use deoplete.
  let g:tern_request_timeout = 1
  let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

  " turn off case sensitive matches
  let g:deoplete#sources#ternjs#case_insensitive = 1

  "Add extra filetypes
  let g:tern#filetypes = [
                  \ 'jsx',
                  \ 'javascript.jsx',
                  \ 'vue'
                  \ ]
  " Use tern_for_vim.
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]

   " deoplete tab-complete
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  " tern
  " jump to definition
  autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR> let g:tern#is_show_argument_hints_enabled = 1
  " jump to definition in new buffer
  autocmd FileType javascript nnoremap <silent> <buffer> gb! :TernDefSplit<CR>

" }}}

" Javascript ---------------------------------------------------------------{{{

  " dont care about elzr/vim-json quote conceal
  let g:vim_json_syntax_conceal = 0

  " let pangloss/js handle flow
  let g:javascript_plugin_flow = 1

" }}}

" Fold, gets it's own section  ---------------------------------------------{{{

  function! MyFoldText() " {{{
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

  set foldtext=MyFoldText()

  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

  autocmd FileType vim setlocal fdc=1
  set foldlevel=99

  " Space to toggle folds.
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevel=0

  autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99

  autocmd FileType css,scss,json setlocal foldmethod=marker
  autocmd FileType css,scss,json setlocal foldmarker={,}

  autocmd FileType coffee setl foldmethod=indent
  let g:xml_syntax_folding = 1
  autocmd FileType xml setl foldmethod=syntax

  autocmd FileType html setl foldmethod=expr
  autocmd FileType html setl foldexpr=HTMLFolds()

  autocmd FileType javascript,typescript,json,go,rust,ruby setl foldmethod=syntax

" }}}

" GitGutter ----------------------------------------------------------------{{{

  let g:gitgutter_enabled = 1

  let g:gitgutter_sign_added = '▎'
  let g:gitgutter_sign_modified = '▎'
  let g:gitgutter_sign_removed = '▏'
  let g:gitgutter_sign_removed_first_line = '▔'
  let g:gitgutter_sign_modified_removed = '▋'

  highlight clear SignColumn
  highlight! GitGutterAdd ctermfg=darkgreen guifg=darkgreen
  highlight! GitGutterChange ctermfg=yellow guifg=yellow
  highlight! GitGutterDelete ctermfg=darkred guifg=darkred
  highlight! GitGutterChangeDelete ctermfg=darkred guifg=darkred

  highlight clear SignColumn
  highlight GitGutterAdd ctermfg=green
  highlight GitGutterChange ctermfg=yellow
  highlight GitGutterDelete ctermfg=red
  highlight GitGutterChangeDelete ctermfg=yellow

  " }}}

" NeoMake ------------------------------------------------------------------{{{

  " dont open error window
  let g:neomake_open_list = 0

  " When reading a buffer (after 1s), and when writing.
  call neomake#configure#automake('rw', 1000)

  " Neomake 'Makers'
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_go_enabled_makers = ['go']
  let g:neomake_warning_sign = {'text': '? '}
  let g:neomake_error_sign = {'text': '! '}

  hi NeomakeErrorSign ctermfg=red
  hi NeomakeWarningSign ctermfg=yellow

"  }}}

" Polyglot -----------------------------------------------------------------{{{

  let g:polyglot_disabled = ['javascript', 'json', 'jsx']

" }}}

" Close-Tag ----------------------------------------------------------------{{{

  let g:closetag_filenames = '*.html,*.jsx,*.js,*.html.erb'

"}}}

" J/K accelerated ----------------------------------------------------------{{{

  nmap j <Plug>(accelerated_jk_gj)
  nmap k <Plug>(accelerated_jk_gk)

"  }}}

" Expand Region ------------------------------------------------------------{{{

  xmap v <Plug>(expand_region_expand)
  xmap V <Plug>(expand_region_shrink)

" }}}

" Goyo and Limelight -------------------------------------------------------{{{

  let g:goyo_width = 120
  nnoremap <Leader>G :Goyo<CR>
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!

"  }}}

" Easy Motion --------------------------------------------------------------{{{

  let g:EasyMotion_use_smartsign_us = 1
  let g:EasyMotion_do_mapping = 0
  let g:EasyMotion_prompt = 'DAaaaaamn → → → '
  nmap ss <Plug>(easymotion-s2)
  nmap sd <Plug>(easymotion-s)
  nmap sf <Plug>(easymotion-overwin-f)
  map  sh <Plug>(easymotion-linebackward)
  map  sl <Plug>(easymotion-lineforward)
  map  s/ <Plug>(easymotion-sn)
  omap s/ <Plug>(easymotion-tn)
  map  sn <Plug>(easymotion-next)
  map  sp <Plug>(easymotion-prev)

" }}}

" Set_italics function ----------------------------------------------------{{{

  function! Set_italics()
    hi htmlArg gui=italic
    hi Comment gui=italic
    hi Type    gui=italic

    hi htmlArg cterm=italic
    hi Comment cterm=italic
    hi Type    cterm=italic
  endfunction

  nnoremap <silent><Leader>b :<C-u>call <SID>toggle_background()<CR>

  function! s:toggle_background()
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
  endfunction

  call Set_italics()

" }}}


