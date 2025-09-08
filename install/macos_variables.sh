#!/bin/bash
############################
# .make.sh

########## Variables
dotfilesdir=$HOME/dotfiles
backupdir=$HOME/dotfiles_old

kittypath=.config/kitty
batpath=.config/bat
neovimpath=.config/nvim
luadir=.config/nvim/lua
luaconfigsdir=.config/nvim/lua/configs
weztermdir=.config/wezterm

directories="
$backupdir
$HOME/$kittypath
$HOME/$batpath
$HOME/$neovimpath
$HOME/$ftpluginpath
$HOME/$luaconfigsdir
$HOME/$weztermdir
$backupdir/$kittypath
$backupdir/$batpath
$backupdir/$neovimpath
$backupdir/$luadir
$backupdir/$luaconfigsdir
$backupdir/$weztermdir
"

files="
.vimrc
.zshrc
.rgignore
.gitignore_global
.config/nvim/init.lua
.config/kitty/kitty.conf
.config/bat/config
.config/wezterm/wezterm.lua
"

OUTPUT=$(find $luadir -name '*.lua' | paste -sd " \n" -)

files+="${OUTPUT}"
echo $files
