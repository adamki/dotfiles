" {{{ VIM-Plug
  call plug#begin('~/.local/share/nvim/plugged')
  " colors
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'trevordmiller/nova-vim'
  Plug 'chriskempson/base16-vim'
  " syntax
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'sheerun/vim-polyglot'
  Plug 'pangloss/vim-javascript'
  " Folding (see fold section)
  Plug 'nelstrom/vim-markdown-folding', {'for': 'markdown'}
  " improve Vim interface
  Plug 'itchyny/vim-cursorword'
  Plug 'szw/vim-maximizer', {'on': ['Maximizer', 'MaximizerToggle']}
  Plug 'terryma/vim-expand-region'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'alvan/vim-closetag'
  Plug 'vim-airline/vim-airline'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tomtom/tcomment_vim'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'airblade/vim-gitgutter'
  Plug 'shime/vim-livedown', {'for': 'markdown'}
  Plug 'easymotion/vim-easymotion'
  " vim extensions
  Plug 'jreybert/vimagit', {'on': ['Magit', 'MagitOnly']}
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-eunuch'
  Plug 'k0kubun/vim-open-github'
  Plug 'junegunn/fzf.vim'
  " IDE level enhancements
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'majutsushi/tagbar'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
  Plug 'w0rp/ale'
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
