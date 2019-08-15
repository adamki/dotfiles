" {{{ VIM-Plug
  call plug#begin('~/.local/share/nvim/plugged')
  " colors
  Plug 'trevordmiller/nova-vim'
  Plug 'morhetz/gruvbox'
  Plug 'arcticicestudio/nord-vim'
  Plug 'joshdick/onedark.vim'
  Plug 'rakr/vim-two-firewatch'
  " Language support
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'ap/vim-css-color'
  " improved Movements & Motions
  Plug 'alvan/vim-closetag'
  " Plug 'christoomey/vim-tmux-navigator'
  Plug 'easymotion/vim-easymotion'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  " improved interface
  Plug 'airblade/vim-gitgutter'
  Plug 'itchyny/vim-cursorword'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'pbogut/fzf-mru.vim', {'on': 'FZFMru'}
  Plug 'k0kubun/vim-open-github', {'on': 'OpenGithub'}
  Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
  Plug 'Yggdroot/indentLine'
  Plug 'scrooloose/nerdtree'
  Plug 'shime/vim-livedown', {'for': 'markdown'}
  Plug 'szw/vim-maximizer', {'on': ['Maximizer', 'MaximizerToggle']}
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
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
  source ~/.config/nvim/ftplugin/aesthetic.vim
  source ~/.config/nvim/ftplugin/system.vim
  source ~/.config/nvim/ftplugin/keymappings.vim
  source ~/.config/nvim/ftplugin/nerdtree.vim
  source ~/.config/nvim/ftplugin/filetypes.vim
" }}}

" {{{ VIM-initialize
  call Set_italics()
" }}}
