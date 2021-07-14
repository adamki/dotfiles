#!/bin/bash
. ./utils/colors.sh

BREW_TAPS=(
  homebrew/cask-fonts
)

BREW_PACKAGES=(
  antigen
  bat
  gotop
  htop
  pyenv
  ripgrep
  skhd
  tmux
  yabai
  neovim
  koekeishiya/formulae/yabai
)

BREW_CASKS=(
  firefox
  font-fira-code
  slack
)

GLOBAL_NPM_PACKAGES=(
  bash-language-server
  eslint
  neovim
  vim-language-server
)

RUBY_GEMS=(
  bundler
  lolcat
  neovim
)

echo -e "${HR}"
echo -e "${bold}Installing Latest Ruby...${normal}"
rbenv install $(rbenv install -l | grep -v - | tail -1)

echo -e "${HR}"
echo -e "${bold}Setting Ruby Default...${normal}"
rbenv global $(rbenv install -l | grep -v - | tail -1)

echo -e "${HR}"
echo -e "${bold}Installing Latest Python 3...${normal}"
pyenv install $(pyenv install --list | grep -v - | grep -v b | tail -1)

echo -e "${HR}"
echo -e "${bold}Installing Ruby Gems...${normal}"
gem install ${RUBY_GEMS[@]}

echo -e "${HR}"
echo -e "${bold}RBENV doctor...${normal}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

echo -e "${HR}"
echo -e "${bold}Installing Global NPM packages...${normal}"
npm install -g ${GLOBAL_NPM_PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}Installing Ne   python3 -m pip install --user --upgrade pynvim"
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim

echo -e "${HR}"
echo -e "${bold}Installing Brew Packages...${normal}"
brew install ${BREW_PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}Fetching Brew Taps...${normal}"
brew tap ${BREW_TAPS[@]}

echo -e "${HR}"
echo -e "${bold}Installing Brew Casks...${normal}"
brew cask install ${BREW_CASKS[@]}

echo -e "${HR}"
echo -e "${bold}Brew Cleanup...${normal}"
brew cleanup

echo -e "${HR}"
echo -e "${bold}Setting up Brew Services...${normal}"
brew services start koekeishiya/formulae/yabai
brew services start skhd

echo -e "${HR}"
echo -e "${bold}${green}Packager Complete...${normal}"
