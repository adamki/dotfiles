#!/bin/bash
. ./utils/colors.sh

echo -e "${HR}"
echo -e "${bold}Checking if Brew is installed...${normal}"
if test ! $(which brew); then
  echo -e "${HR}"
  echo -e "${bold}Brew Not Found. Installing Brew...${normal}"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "${HR}"
echo -e "${bold}Updating Brew...${normal}"
brew update

echo -e "${HR}"
echo -e "${bold}Installing Zsh...${normal}"
brew install zsh

echo -e "${HR}"
echo -e "${bold}Installing antigen...${normal}"
brew install antigen

echo -e "${HR}"
echo -e "${bold}Installing rbenv...${normal}"
brew install rbenv

source ./install/shell_utils.sh

echo -e "${HR}"
echo -e "${bold}${green}Bootstrapper Complete...${normal}"
echo -e "${bold}${green}Starting ZSH now...${normal}"
echo -e "${bold}${green}Please run ./install/macos_packager.sh${normal}"

exec zsh
