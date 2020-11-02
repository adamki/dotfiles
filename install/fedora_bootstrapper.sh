#!/bin/bash
. ./utils/colors.sh

echo -e "${HR}"
echo -e "${bold}Updating DNF...${normal}"
sudo dnf update

echo -e "${HR}"
echo -e "${bold}Installing git...${normal}"
sudo dnf install git

echo -e "${HR}"
echo -e "${bold}Updating Curl...${normal}"
sudo dnf install curl

echo -e "${HR}"
echo -e "${bold}Installing Zsh...${normal}"
sudo dnf install zsh

echo -e "${HR}"
echo -e "${bold}Installing Antigen...${normal}"
curl -L git.io/antigen > ~/antigen.zsh

echo -e "${HR}"
echo -e "${bold}Installing rbenv...${normal}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

echo -e "${HR}"
echo -e "${bold}Installing pyenv...${normal}"
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

source ./install/shell_utils.sh

echo -e "${HR}"
echo -e "${bold}${green}Bootstrapper Complete...${normal}"
echo -e "${bold}${green}Starting ZSH now...${normal}"
echo -e "${bold}${green}Please run ./install/fedora_packager.sh${normal}"

exec zsh
