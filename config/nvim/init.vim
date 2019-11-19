" {{{ VIM-Plug
  call plug#begin('~/.local/share/nvim/plugged')
  " colors
  Plug 'trevordmiller/nova-vim'
  Plug 'morhetz/gruvbox'
  Plug 'arcticicestudio/nord-vim'
  Plug 'joshdick/onedark.vim'
  Plug 'rakr/vim-two-firewatch'
  Plug 'jacoborus/tender.vim'
  Plug 'flrnprz/plastic.vim'
  Plug 'Rigellute/rigel'
  Plug 'drewtempelmeyer/palenight.vim'
  " Language support
  Plug 'sheerun/vim-polyglot'
  Plug 'ap/vim-css-color'
  " improved Movements & Motions
  Plug 'alvan/vim-closetag'
  Plug 'easymotion/vim-easymotion'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  " improved interface
  Plug 'airblade/vim-gitgutter'
  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'pbogut/fzf-mru.vim'
  Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
  Plug 'Yggdroot/indentLine'
  Plug 'shime/vim-livedown', {'for': 'markdown', 'do': 'npm install -g livedown'}
  Plug 'szw/vim-maximizer', {'on': ['Maximizer', 'MaximizerToggle']}
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb', {'on': 'Gbrowse'}
  Plug 'shumphrey/fugitive-gitlab.vim', {'on': 'Gbrowse'}
  Plug 'itchyny/lightline.vim'
  " miscellaneous
  Plug 'nelstrom/vim-markdown-folding', {'for': 'markdown'}
  " integrations
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
" }}}
