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

directories="
$backupdir
$HOME/$kittypath
$HOME/$batpath
$HOME/$neovimpath
$HOME/$ftpluginpath
$backupdir/$kittypath
$backupdir/$batpath
$backupdir/$neovimpath
$backupdir/$luadir
"

files="
.vimrc
.zshrc
.rgignore
.gitignore_global
.config/nvim/init.lua
.config/nvim/coc-settings.json
.config/nvim/lua/autocommands.lua
.config/nvim/lua/configurations.lua
.config/nvim/lua/filetypes.lua
.config/nvim/lua/mappings.lua
.config/nvim/lua/plugins.lua
.config/nvim/lua/settings.lua
.config/nvim/lua/statusline.lua
.config/kitty/kitty.conf
.config/bat/config
"
