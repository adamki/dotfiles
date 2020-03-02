#!/bin/bash
. ./utils/colors.sh

echo -e "${HR}"
echo -e "${bold}Looking for fastest Mirrors...${normal}"
sudo pacman-mirrors --fasttrack

echo -e "${HR}"
echo -e "${bold}Updating Pacman...${normal}"
sudo pacman -Syyu

echo -e "${HR}"
echo -e "${bold}Installing rbenv...${normal}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

source ./install/shell_utils.sh

echo -e "${HR}"
echo -e "${bold}${green}Bootstrapper Complete...${normal}"
echo -e "${bold}${green}Restarting Bash now...${normal}"
echo -e "${bold}${green}Please run ./install/arch_packager.sh${normal}"

exec bash
