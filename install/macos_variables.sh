#!/bin/bash
############################
# .make.sh

########## Variables
dotfilesdir=$HOME/dotfiles
backupdir=$HOME/dotfiles_old

batpath=.config/bat
neovimpath=.config/nvim
luadir=.config/nvim/lua
luaconfigsdir=.config/nvim/lua/configs
weztermdir=.config/wezterm

directories="
$backupdir
$HOME/$batpath
$HOME/$neovimpath
$HOME/$ftpluginpath
$HOME/$luaconfigsdir
$HOME/$weztermdir
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
.config/nvim/stylua.toml
.config/bat/config
.config/wezterm/wezterm.lua
"

OUTPUT=$(find $luadir -name '*.lua' | paste -sd " \n" -)

files+="${OUTPUT}"
echo $files
