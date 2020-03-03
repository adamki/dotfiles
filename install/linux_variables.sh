#!/bin/bash
############################

########## Variables
dotfilesdir=$HOME/dotfiles
backupdir=$HOME/dotfiles_old

i3dir=.config/i3
rofidir=.config/rofi
kittydir=.config/kitty
nvimdir=.config/nvim
comptondir=.config/compton
ftpluginpath=.config/nvim/ftplugin

directories="
$backupdir
$HOME/$i3dir
$HOME/$rofidir
$HOME/$kittydir
$HOME/$nvimdir
$HOME/$comptondir
$HOME/$ftpluginpath
$backupdir/$i3dir
$backupdir/$rofidir
$backupdir/$kittydir
$backupdir/$nvimdir
$backupdir/$comptondir
$backupdir/$ftpluginpath
"

files="
.vimrc
.zshrc
.rgignore
.gitignore_global
.config/rofi/config.rasi
.config/rofi/drun.rasi
.config/rofi/run.rasi
.config/compton/compton.conf
.config/nvim/init.vim
.config/nvim/coc-settings.json
.config/nvim/ftplugin/plugins.vim
.config/nvim/ftplugin/system.vim
.config/nvim/ftplugin/keymaps.vim
.config/nvim/ftplugin/aesthetic.vim
.config/nvim/ftplugin/filetypes.vim
.config/nvim/ftplugin/fold.vim
.config/nvim/ftplugin/functions.vim
.config/nvim/ftplugin/status.vim
.config/kitty/kitty.conf
"
