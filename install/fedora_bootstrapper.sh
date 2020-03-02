#!/bin/bash
. ./utils/colors.sh

echo -e "${HR}"
echo -e "${bold}Updating DNF...${normal}"
sudo dnf update

echo -e "${HR}"
echo -e "${bold}Updating Curl...${normal}"
sudo dnf install curl

echo -e "${HR}"
echo -e "${bold}Installing rbenv...${normal}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

source ./install/shell_utils.sh

echo -e "${HR}"
echo -e "${bold}${green}Bootstrapper Complete...${normal}"
echo -e "${bold}${green}Restarting Bash now...${normal}"
echo -e "${bold}${green}Please run ./install/fedora_packager.sh${normal}"

exec bash
