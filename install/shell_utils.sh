#!/bin/bash
. ./utils/colors.sh

echo -e "${HR}"
echo -e "${bold}Installing Kitty Terminal...${normal}"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
    launch=n

echo -e "${HR}"
echo -e "${bold}Installing FZF...${normal}"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo -e "${HR}"
echo -e "${bold}Installing NVM...${normal}"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

echo -e "${HR}"
echo -e "${bold}Sourcing NVM...${normal}"
source ${HOME}/.nvm/nvm.sh
nvm --version

echo -e "${HR}"
echo -e "${bold}Installing Latest Node...${normal}"
nvm install node #"node is alway latest version"

echo -e "${HR}"
echo -e "${bold}${green}Bootstrapper Complete...${normal}"
echo -e "${bold}Changing default SHELL to ZSH...${normal}"
chsh -s $(which zsh)
