#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# this scrpt comes from http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

################################################################################
# three steps to syncing dotfiles on a new machine.
# 1. cd ~/dotfiles
# 2. chmod +x makesymlinks.sh
# 3. ./makesymlinks.sh
################################################################################

########## Variables
dir=~/dotfiles
backupdir=~/dotfiles_old
neovimpath=~/.config/nvim
ftpluginpath=~/.config/nvim/ftplugin
kittypath=~/.config/kitty

# list of files/folders to symlink in homedir
files="tmux.conf
vimrc
zshrc
config/nvim/init.vim
config/nvim/ftplugin/plugins.vim
config/nvim/ftplugin/nerdtree.vim
config/nvim/ftplugin/system.vim
config/nvim/ftplugin/keymappings.vim
config/nvim/ftplugin/aesthetic.vim
config/nvim/ftplugin/filetypes.vim
config/nvim/ftplugin/fold.vim
config/kitty/kitty.conf"

# Set up NVIM path
mkdir -p $neovimpath
printf "Created dir: $neovimpath ...............................................done. \n"

# Set up kitty path
mkdir -p $kittypath
printf "Created dir: $kittypath ..........................................done. \n"

# Set up ftplugin path
mkdir -p $ftpluginpath
printf "Created dir: $ftpluginpath ......................................done. \n"

# create dotfiles_old in homedir
mkdir -p $backupdir
printf  "Created dir: $backupdir ...............................................done. \n"

# change to the dotfiles directory
cd $dir
printf "CD to dir: $dir ...............................................done. \n"

printf "\n\n"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    mv ~/.$file $backupdir
    ln -s $dir/$file ~/.$file
    printf "Symlinking ~/$file ----------------- >>>  $dir/$file \n"
done

printf "\n\n"
printf "Complete"
