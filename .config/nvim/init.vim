" {{{ VIM-Plug
  call plug#begin('~/.local/share/nvim/plugged')
  " colors
  Plug 'lifepillar/vim-gruvbox8'
  Plug 'joshdick/onedark.vim'
  Plug 'Rigellute/rigel'
  " Language support
  Plug 'sheerun/vim-polyglot'
  " Improved Movements & Motions
  Plug 'alvan/vim-closetag'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'justinmk/vim-sneak'
  " Improved interface
  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'pbogut/fzf-mru.vim'
  Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
  Plug 'Yggdroot/indentLine'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
  Plug 'szw/vim-maximizer', {'on': ['Maximizer', 'MaximizerToggle']}
  Plug 'tpope/vim-eunuch'
  " Integrations
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'shumphrey/fugitive-gitlab.vim'
 call plug#end()
" }}}

" {{{ filetype imports
  source ~/.config/nvim/ftplugin/system.vim
  source ~/.config/nvim/ftplugin/plugins.vim
  source ~/.config/nvim/ftplugin/functions.vim
  source ~/.config/nvim/ftplugin/fold.vim
  source ~/.config/nvim/ftplugin/filetypes.vim
  source ~/.config/nvim/ftplugin/aesthetic.vim
  source ~/.config/nvim/ftplugin/keymaps.vim
  source ~/.config/nvim/ftplugin/status.vim
" }}}

" {{{ VIM-initialize
  call Set_italics()
  call Set_status_bar_colors()
  " call Set_transparency()
" }}}
