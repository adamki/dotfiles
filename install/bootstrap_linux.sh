#!/bin/bash
. ./utils/colors.sh
# install


echo -e "${HR}"
echo -e "${bold}Looking for fastest Mirrors...${normal}"
# sudo pacman-mirrors --fasttrack

echo -e "${HR}"
echo -e "${bold}Updating Pacman...${normal}"
sudo pacman -Syyu

echo -e "${HR}"
echo -e "${bold}Updating Zsh...${normal}"
sudo pacman -S zsh

echo -e "${HR}"
echo -e "${bold}Cloning pFetch...${normal}"
git clone git@github.com:dylanaraps/pfetch.git ~/pfetch

echo -e "${HR}"
echo -e "${bold}Installing Vim-Plug...${normal}"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "${HR}"
echo -e "${bold}Installing Kitty Terminal...${normal}"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

echo -e "${HR}"
echo -e "${bold}Installing Antigen...${normal}"
curl -L git.io/antigen > ~/antigen.zsh

echo -e "${HR}"
echo -e "${bold}Installing FZF...${normal}"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo -e "${HR}"
echo -e "${bold}Installing NVM...${normal}"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

echo -e "${HR}"
echo -e "${bold}Sourcing NVM...${normal}"
source ${HOME}/.nvm/nvm.sh
nvm --version

echo -e "${HR}"
echo -e "${bold}Installing rbenv...${normal}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

echo -e "${HR}"
echo -e "${bold}Changing default SHELL to ZSH...${normal}"
chsh -s $(which zsh)

echo -e "${HR}"
echo -e "${bold}${green}Bootstrap Complete...${normal}"
echo -e "${bold}${green}Start ZSH now...${normal}"
