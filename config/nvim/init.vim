" {{{ VIM-Plug
  call plug#begin('~/.local/share/nvim/plugged')
  " colors
  Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'
  Plug 'Rigellute/rigel'
  Plug 'trevordmiller/nova-vim'
  " Language support
  Plug 'sheerun/vim-polyglot'
  " improved Movements & Motions
  Plug 'alvan/vim-closetag'
  Plug 'easymotion/vim-easymotion'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  " improved interface
  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'pbogut/fzf-mru.vim'
  Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
  Plug 'Yggdroot/indentLine'
  Plug 'shime/vim-livedown', {'for': 'markdown', 'do': 'npm install -g livedown'}
  Plug 'szw/vim-maximizer', {'on': ['Maximizer', 'MaximizerToggle']}
  Plug 'tpope/vim-eunuch'
  Plug 'itchyny/lightline.vim'
  " integrations
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb', {'on': 'Gbrowse'}
  Plug 'shumphrey/fugitive-gitlab.vim', {'on': 'Gbrowse'}
 " For async completion
 call plug#end()
" }}}

" {{{ filetype imports
  source ~/.config/nvim/ftplugin/plugins.vim
  source ~/.config/nvim/ftplugin/fold.vim
  source ~/.config/nvim/ftplugin/system.vim
  source ~/.config/nvim/ftplugin/keymappings.vim
  source ~/.config/nvim/ftplugin/filetypes.vim
  source ~/.config/nvim/ftplugin/aesthetic.vim
" }}}

" {{{ VIM-initialize
  call Set_italics()
  call Set_transparency()
  call NumberToggle()
" }}}
