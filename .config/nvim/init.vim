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

  " colors
  Plug 'challenger-deep-theme/vim'
  Plug 'gregsexton/Atom'
  Plug 'scheakur/vim-scheakur'
  Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'cseelus/vim-colors-lucid'
  Plug 'arcticicestudio/nord-vim'
  Plug 'liuchengxu/space-vim-dark'
  Plug 'jacoborus/tender.vim'
  Plug 'rakr/vim-two-firewatch'
  Plug 'rakr/vim-colors-rakr'
  Plug 'NLKNguyen/papercolor-theme'

  Plug 'tyrannicaltoucan/vim-deep-space'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tyrannicaltoucan/vim-quantum'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'mhartington/oceanic-next'
  Plug 'rakr/vim-one'
  Plug 'morhetz/gruvbox'
  Plug 'dracula/vim'
  Plug 'joshdick/onedark.vim'
  Plug 'kenwheeler/glow-in-the-dark-gucci-shark-bites-vim'
  " syntax
  Plug 'sheerun/vim-polyglot'
  Plug 'othree/yajs'
  Plug 'jelera/vim-javascript-syntax'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'
  Plug 'elzr/vim-json'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'Yggdroot/indentLine'

  " Folding (see fold section)
  Plug 'nelstrom/vim-markdown-folding', {'for': 'markdown'}

  " vim extensions
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'raimondi/delimitmate'
  Plug 'vim-airline/vim-airline'
  Plug 'mhinz/vim-sayonara'
  Plug 'jreybert/vimagit'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-markdown', {'for': 'markdown'}
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'justinmk/vim-dirvish'
  Plug 'tpope/vim-eunuch'
  Plug 'airblade/vim-gitgutter'
  Plug 'shime/vim-livedown'

  " IDE level enhancements
  Plug 'shougo/denite.nvim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
  Plug 'neomake/neomake'
  Plug 'benjie/neomake-local-eslint.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'alvan/vim-closetag'

  call plug#end()

" }}}

" MarkDown Live Previews ---------------------------------------------------{{{

  " should markdown preview get shown automatically upon opening markdown buffer
  let g:livedown_autorun = 1

  " should the browser window pop-up upon previewing
  let g:livedown_open = 1

" }}}

" Aesthetix ----------------------------------------------------------------{{{

  set cursorline                                  " HL the current Line #
  syntax on                                       " enable syntax
  set background=light                            " must go before :colorscheme
  colorscheme hybrid_material                     " must go after set bg
  let g:enable_italic_font = 1                    " Make sure to italicize
  let g:indentLine_char = '┆ '                    " line indent icon

" }}}

" System Settings ----------------------------------------------------------{{{

  " neovim settings
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    tnoremap <Esc> <C-\><C-n>             " enable ESC behavior when in terminal emulator
    set mouse=a                           " enable mouse mode
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1     " sets colors to be true
    let mapleader = ','                   " set dat leader
    set colorcolumn=80                    " keep lines short
    set termguicolors                     " enable true colors
    set clipboard+=unnamedplus            " visual copy works to native OS
    set nopaste                           " but default to nopaste
    set pastetoggle=<f6>                  " toggle paste/nopaste
    set list                              " show white space
    autocmd BufWritePre * %s/\s\+$//e     " remove unwanted space(s) on Buffer Pre-write
    set noswapfile                        " do NOT create swapfiles for new buffers
    filetype on                           " let vim detect fileType
    set number relativenumber             " line numbers!
    set numberwidth=1                     " make number gutter small
    set tabstop=2 shiftwidth=2 expandtab  " better tabs and line shifts
    set virtualedit=                      " unset virtualedit
    set wildmenu                          " better vim command completion
    set laststatus=2                      " always show statusline in window
    set nowrap                            " wrap lines at word
    set wildmode=list:longest,full        " better vim command completion
    set autoread                          " detect if file has changed
    set undofile                          " enable persistant undo
    set undodir=~/.config/nvim/undo       " undo hist save location
    set splitbelow                        " Horizontal split below current.
    set splitright                        " Vertical split to right of current.
    if !&scrolloff
      set scrolloff=8                     " Show next 8 lines while scrolling.
    endif
    if !&sidescrolloff
      set sidescrolloff=8                 " Show next 8 columns while side-scrolling.
    endif
    "always place cursor at zz
    autocmd BufRead * normal zz
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif " remember cursor position

" }}}

" Key Mappings -------------------------------------------------------------{{{

  " no ex mode
  nnoremap Q <nop>
  nnoremap <Leader>w :w<CR>
  nnoremap <Leader>q :q<CR>
  nnoremap <Leader>Q :q!<CR>
  nnoremap <Leader>x :x<CR>
  " reload nvimrc from soource
  nnoremap <Leader>r :so ~/.config/nvim/init.vim<CR>
  " copy current file path
  nmap cp :let @+= expand("%") <cr>
  " bind Search/Replace to Leader
  nnoremap <Leader>S :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
  " better line end navigation
  noremap H ^
  noremap L g_
  " shortcut to save your wrist from RSI
  nnoremap ; :
  " vim omnicomplete
  inoremap <C-f> <C-x><C-f>
  " better lateral block movement
  vmap < <gv
  vmap > >gv
  " turn off high-lighted search results
  nnoremap <Space><Space> :noh<cr>

  " move lines in normal
  nnoremap ∆ :m .+1<CR>==
  nnoremap ˚ :m .-2<CR>==

  " move lines in insert
  inoremap ∆ <Esc>:m .+1<CR>==gi
  inoremap ˚ <Esc>:m .-2<CR>==gi

  " full screen dat split
  nnoremap <C-w>f  200<C-w>\| \| 200<C-w>
  nnoremap <left> :vertical resize -5<cr>
  nnoremap <down> :resize +5<cr>
  nnoremap <up> :resize -5<cr>
  nnoremap <right> :vertical resize +5<cr>

" }}}

" Operator-Mono Italix -----------------------------------------------------{{{

  hi htmlArg gui=italic
  hi Comment gui=italic
  hi Type    gui=italic
  hi htmlArg cterm=italic
  hi Comment cterm=italic
  hi Type    cterm=italic

" }}}

" Airline/TABS Config-------------------------------------------------------{{{

  let g:airline_theme='simple'                                         " set airline theme
  set noshowmode                                                       " hide vim's mode status
  set hidden                                                           " hide buffers instead of unload them
  cnoreabbrev <silent> <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif                                                                " set up symbol dictionary
  let g:airline#extensions#tabline#enabled = 1                         " enables tabline
  let g:airline#extensions#tabline#buffer_idx_mode = 1                 " enable buffer indices
  let g:airline#extensions#neomake#error_symbol='• '                   " neomake lint(error)
  let g:airline#extensions#neomake#warning_symbol='•  '                " neomake lint(error)
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'  " show abbreviated filepath

  let g:airline_powerline_fonts = 1                                    " powerline font integration for icons
  let g:airline_symbols.branch = ''                                   " git branch symbol!

  " tab shortcuts ----------------------------------------------------------{{{

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

  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''

" }}}

" Denite -------------------------------------------------------------------{{{

  let g:webdevicons_enable_denite = 0          " disable devicons cuz they slow
  let s:menus = {}

  call denite#custom#option('default', {
        \ 'prompt': '❯',
        \ 'highlight_matched_char': 'Function',
        \ 'highlight_mode_normal': 'Function',
        \})
  call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git', '', '--hidden'])
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--no-heading', '-S'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])

  call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap')
  call denite#custom#map('insert', '<C-s>', '<denite:do_action:vsplit>', 'noremap')
  call denite#custom#map('insert', '<C-i>', '<denite:do_action:split>', 'noremap')
  call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
  call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

  " nnoremap <silent> <c-p> :Denite file_rec<CR>
  nnoremap <C-p> :<C-u>Denite file_rec buffer<CR>
  " search open buffers
  nnoremap <leader><Space>b :<C-u>DeniteBufferDir buffer<CR>
  " find word under cursor
  nnoremap <leader><bs> :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
  " ripgrep an input
  nnoremap <leader>a :<C-u>Denite grep:. -mode=normal<CR>
  " ripgrep an input in Directory
  nnoremap <leader><Space>a :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
  " find file in dir
  nnoremap <leader>d :<C-u>DeniteBufferDir file_rec<CR>

  hi link deniteMatchedChar Special

  " denite-extras
  nnoremap <silent> <leader>h :Denite help<CR>
  nnoremap <silent> <leader>c :Denite colorscheme<CR>
  nnoremap <leader>o :<C-u>Denite location_list -mode=normal -no-empty<CR>
  nnoremap <leader>hs :<C-u>Denite history:search -mode=normal<CR>
  nnoremap <leader>hc :<C-u>Denite history:cmd -mode=normal<CR>

"}}}

" Dirvish ------------------------------------------------------------------{{{

  let g:dirvish_mode = ':sort r /[^\/]$/'      " folders at the top
  let g:dirvish_relative_paths = 1             " file paths from parent dir
  " open in new Tab
  autocmd FileType dirvish nnoremap <buffer>t :call dirvish#open('tabedit', 0)<cr>
  autocmd FileType dirvish nnoremap <buffer>T :call dirvish#open('tabedit', 1)<cr>
  " open in new split
  autocmd FileType dirvish nnoremap <buffer>i :call dirvish#open('split', 0)<cr>
  " open in new Vsplit
  autocmd FileType dirvish nnoremap <buffer>s :call dirvish#open('vsplit', 0)<cr>
  " make new file
  autocmd FileType dirvish nnoremap <buffer>n :e %
  " make new dir
  autocmd FileType dirvish nnoremap <buffer>b :!mkdir %
  " open file in new tab
  autocmd FileType dirvish
        \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
  autocmd FileType dirvish call fugitive#detect(@%)       " enable Fugitive
  " hide dotfiles. 'R' to toggle them back
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ gh :silent keeppatterns g@\v/\.[^\/]+/?$@d<cr>
  augroup END

"}}}

" Deoplete  ----------------------------------------------------------------{{{

  "start Deoplete always
  let g:deoplete#enable_at_startup = 1

  " use deoplete for .jsx
  let g:jsx_ext_required = 0

  autocmd CompleteDone * pclose

  let g:deoplete#file#enable_buffer_path=1

  " custom omni source markers
  call deoplete#custom#set('buffer', 'mark', 'ℬ')
  call deoplete#custom#set('ternjs', 'mark', '')
  call deoplete#custom#set('omni', 'mark', '⌾')
  call deoplete#custom#set('file', 'mark', 'file')

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
      let line = getline(v:foldstart)
      let nucolwidth = &fdc + &number * &numberwidth
      let windowwidth = winwidth(0) - nucolwidth - 3
      let foldedlinecount = v:foldend - v:foldstart

      " expand tabs into spaces
      let onetab = strpart('          ', 0, &tabstop)
      let line = substitute(line, '\t', onetab, 'g')

      let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
      " let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - len('lines')
      " let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - len('lines   ')
      let fillcharcount = windowwidth - len(line)
      " return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . ' Lines'
      return line . '…' . repeat(" ",fillcharcount)
  endfunction " }}}

  set foldtext=MyFoldText()

  " autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  " autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

  autocmd FileType vim setlocal fdc=1
  set foldlevel=99

  " Space to toggle folds.
  nnoremap <Space> za
  vnoremap <Space> za
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

"  }}}

" Polyglot -----------------------------------------------------------------{{{

  let g:polyglot_disabled = ['javascript', 'json', 'jsx']

" }}}

" Navigate between vim buffers and tmux panels -----------------------------{{{

  " let g:tmux_navigator_no_mappings = 1
  " nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  " nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  " nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
  " nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>

"}}}

" Close-Tag ----------------------------------------------------------------{{{

  let g:closetag_filenames = '*.html,*.jsx, *.js'

"}}}
