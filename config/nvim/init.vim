" {{{ VIM-Plug
  call plug#begin('~/.local/share/nvim/plugged')
  " colors
  Plug 'trevordmiller/nova-vim'
  Plug 'morhetz/gruvbox'
  Plug 'arcticicestudio/nord-vim'
  Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'connorholyday/vim-snazzy'
  Plug 'rakr/vim-two-firewatch'
  " Language support
  Plug 'maxmellon/vim-jsx-pretty'
  " Plug 'leafgarland/typescript-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'sheerun/vim-polyglot'
  " improved Movements & Motions
  Plug 'alvan/vim-closetag'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'easymotion/vim-easymotion'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  " improved interface
  Plug 'chrisbra/Colorizer'
  Plug 'airblade/vim-gitgutter'
  Plug 'itchyny/vim-cursorword'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'pbogut/fzf-mru.vim', {'on': 'FZFMru'}
  Plug 'k0kubun/vim-open-github', {'on': 'OpenGithub'}
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
  " miscellaneous
  Plug 'nelstrom/vim-markdown-folding', {'for': 'markdown'}
  " integrations
  Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  " Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
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
