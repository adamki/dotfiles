#!/bin/bash
############################
# .make.sh

########## Variables
dotfilesdir=$HOME/dotfiles
backupdir=$HOME/dotfiles_old

kittypath=.config/kitty
neovimpath=.config/nvim
ftpluginpath=.config/nvim/ftplugin

directories="
$backupdir

$HOME/$kittypath
$HOME/$neovimpath
$HOME/$ftpluginpath

$backupdir/$kittypath
$backupdir/$neovimpath
$backupdir/$ftpluginpath
"

files="
.vimrc
.bash_profile
.yabairc
.skhdrc
.rgignore
.gitignore_global
.config/nvim/init.vim
.config/nvim/coc-settings.json
.config/nvim/ftplugin/plugins.vim
.config/nvim/ftplugin/system.vim
.config/nvim/ftplugin/keymaps.vim
.config/nvim/ftplugin/aesthetic.vim
.config/nvim/ftplugin/filetypes.vim
.config/nvim/ftplugin/functions.vim
.config/nvim/ftplugin/status.vim
.config/nvim/ftplugin/fold.vim
.config/kitty/kitty.conf
"
