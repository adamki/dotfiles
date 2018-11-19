" {{{ VIM-Plug
  call plug#begin('~/.local/share/nvim/plugged')
  " colors
  Plug 'trevordmiller/nova-vim'
  Plug 'morhetz/gruvbox'
  Plug 'arcticicestudio/nord-vim'
  Plug 'junegunn/seoul256.vim'
  Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'joshdick/onedark.vim'
  Plug 'drewtempelmeyer/palenight.vim'
  " Language support
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'sheerun/vim-polyglot'
  " improved Movement/Actions
  Plug 'alvan/vim-closetag'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'easymotion/vim-easymotion'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  " improved interface
  Plug 'airblade/vim-gitgutter'
  Plug 'itchyny/vim-cursorword'
  Plug 'jreybert/vimagit', {'on': ['Magit', 'MagitOnly']}
  Plug 'junegunn/fzf.vim'
  Plug 'k0kubun/vim-open-github'
  Plug 'majutsushi/tagbar'
  Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'scrooloose/nerdtree'
  Plug 'shime/vim-livedown', {'for': 'markdown'}
  Plug 'szw/vim-maximizer', {'on': ['Maximizer', 'MaximizerToggle']}
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'w0rp/ale'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " miscellaneous
  Plug 'nelstrom/vim-markdown-folding', {'for': 'markdown'}
  " integrations
  Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
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
