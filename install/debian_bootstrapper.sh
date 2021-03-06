#! /bin/bash
. ./utils/colors.sh

echo -e "${HR}"
echo -e "${bold}Updating APT-GET...${normal}"
sudo apt-get update && sudo apt-get upgrade

echo -e "${HR}"
echo -e "${bold}Installing git...${normal}"
sudo apt-get install git

echo -e "${HR}"
echo -e "${bold}Installing curl...${normal}"
sudo apt-get install curl

echo -e "${HR}"
echo -e "${bold}Installing Zsh...${normal}"
sudo apt-get install zsh

echo -e "${HR}"
echo -e "${bold}Installing Antigen...${normal}"
curl -L git.io/antigen > ~/antigen.zsh

echo -e "${HR}"
echo -e "${bold}Installing Rbenv...${normal}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

echo -e "${HR}"
echo -e "${bold}Installing pyenv...${normal}"
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

source ./install/shell_utils.sh

echo -e "${HR}"
echo -e "${bold}${green}Bootstrapper Complete...${normal}"
echo -e "${bold}${green}Starting ZSH now...${normal}"
echo -e "${bold}${green}Please run ./install/debian_packager.sh${normal}"
echo -e "${bold}${red}Could NOT INSTALL BAT. Please see https://github.com/sharkdp/bat#on-ubuntu for manual install instructions${normal}"

exec zsh
