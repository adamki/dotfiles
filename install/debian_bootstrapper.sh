#! /bin/bash
. ./utils/colors.sh

echo -e "${HR}"
echo -e "${bold}Updating APT-GET...${normal}"
sudo apt-get update && sudo apt-get upgrade

echo -e "${HR}"
echo -e "${bold}Installing Zsh...${normal}"
sudo apt-get install zsh

echo -e "${HR}"
echo -e "${bold}Installing Antigen...${normal}"
curl -L git.io/antigen > ~/antigen.zsh

echo -e "${HR}"
echo -e "${bold}Installing Rbenv...${normal}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

source ./install/shell_utils.sh

echo -e "${HR}"
echo -e "${bold}${green}Bootstrapper Complete...${normal}"
echo -e "${bold}${green}Starting ZSH now...${normal}"
echo -e "${bold}${green}Please run ./install/debian_packager.sh${normal}"

exec zsh
