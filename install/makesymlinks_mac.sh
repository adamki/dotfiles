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

. "${DOTFILES}/utils/colors.sh"
########## Variables
dir=~/dotfiles
backupdir=~/dotfiles_old
neovimpath=~/.config/nvim
ftpluginpath=~/.config/nvim/ftplugin
kittypath=~/.config/kitty

echo -e "${HR}Starting Symlink Script...\n\nCreating Directories...${HR}"
mkdir -p $neovimpath
mkdir -p $kittypath
mkdir -p $ftpluginpath
mkdir -p $backupdir

echo -e "${HR}Changing Directories: ${dir}${HR}\n\n"
cd $dir

files="tmux.conf
vimrc
zshrc
yabairc
skhdrc
config/nvim/coc-settings.json
config/nvim/init.vim
config/nvim/ftplugin/plugins.vim
config/nvim/ftplugin/nerdtree.vim
config/nvim/ftplugin/system.vim
config/nvim/ftplugin/keymappings.vim
config/nvim/ftplugin/aesthetic.vim
config/nvim/ftplugin/filetypes.vim
config/nvim/ftplugin/fold.vim
config/kitty/kitty.conf"

for file in $files; do
    echo -e "${HR}Attepting Symlink for: $file${HR}"
    mv ~/.$file $backupdir
    mvvalue=$?
    ln -s $dir/$file ~/.$file
    lnvalue=$?

    if [[ $mvvalue -ne 0 ]] || [[ $lnvalue -ne 0 ]]; then
      echo -e "${red}Warning:${reset} Symlink already exists for: ${red}${file}${reset}"
    else
      echo -e "${green}.$file${reset} has been symlinked to: ${green}dotfiles/$file${reset}"
    fi
done

echo -e "\n\n${HR}Symlinking Complete!\nOld config files have been backed up to ${green}$backupdir${reset}${HR}"
