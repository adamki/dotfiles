#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/adams-dotfiles
# this scrpt comes from http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

################################################################################
# three steps to syncing dotfiles on a new machine.
# 1.  cd ~/adams-dotfiles
# 2.  chmod +x makesymlinks.sh
# 3.  ./makesymlinks.sh
################################################################################
########## Variables
dir=~/adams-dotfiles                    # dotfiles directory
olddir=~/dotfiles_old                   # old dotfiles backup directory
neovimpath=~/.config/nvim
ftpluginpath=~/.config/nvim/ftplugin
files="config/nvim/init.vim config/nvim/ftplugin/nerdtree.vim config/nvim/ftplugin/system.vim config/nvim/ftplugin/keymappings.vim config/nvim/ftplugin/aesthetic.vim zshrc tmux.conf"          # list of files/folders to symlink in homedir
# files="bashrc vimrc vim zshrc oh-my-zsh"    # list of files/folders to symlink in homedir

# Set up NVIM path
printf "Creating needed dir path for Neovim install...................done"
mkdir -p $neovimpath
printf "\n\n\n"

# Set up ftplugin path
printf "Creating needed dir path for nvim/ftplugin install................done"
mkdir -p $ftpluginpath
printf "\n\n\n"

# create dotfiles_old in homedir
printf  "Creating $olddir for backup of any existing dotfiles in ~ ...done"
mkdir -p $olddir
printf "\n\n\n"

# change to the dotfiles directory
printf "Changing to the $dir directory................................done"
cd $dir
printf "\n\n\n"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    printf "Moving any existing dotfiles from ~ to $olddir................done"
    mv ~/.$file $olddir
    printf "\n\n\n"

    printf "Creating symlink to $file in home directory...................done"
    ln -s $dir/$file ~/.$file
    printf "\n\n\n"
done

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
  # Clone my oh-my-zsh repository from GitHub only if it isn't already present
  if [[ ! -d $dir/oh-my-zsh/ ]]; then
    git clone http://github.com/robbyrussell/oh-my-zsh.git
  fi
  # Set the default shell to zsh if it isn't currently set to zsh
  if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    chsh -s $(which zsh)
  fi
else
  # If zsh isn't installed, get the platform of the current machine
  platform=$(uname);
  # If the platform is Linux, try an apt-get to install zsh and then recurse
  if [[ $platform == 'Linux' ]]; then
    if [[ -f /etc/redhat-release ]]; then
      sudo yum install zsh
      install_zsh
    fi
    if [[ -f /etc/debian_version ]]; then
      sudo apt-get install zsh
      install_zsh
    fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
      printf "Please install zsh, then re-run this script! \n"
      exit
    fi
  fi
}


install_zsh
