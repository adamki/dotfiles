#!/bin/bash
. ./utils/colors.sh

AUR_REPOS="
  gotop
  neovim-nightly
"
PAMAC_PACKAGES=(
  feh
  lolcat
)
PACKAGES=(
  bat
  compton
  curl
  firefox
  htop
  i3-gaps
  nitrogen
  otf-fira-code
  ranger
  ripgrep
  rofi
  timeshift
  timeshift-autosnap
  tmux
  xcape
  zsh
)

GEMS=(
  bundler
  neovim
)

GLOBAL_NPM_PACKAGES=(
  # bash-language-server
  eslint
  livedown
  neovim
  vim-language-server
)

echo -e "${HR}"
echo -e "${bold}Installing Latest Node...${normal}"
nvm install node #"node is alway latest version"

echo -e "${HR}"
echo -e "${bold}Installing Latest Ruby...${normal}"
rbenv install $(rbenv install -l | grep -v - | tail -1)

echo -e "${HR}"
echo -e "${bold}Setting Ruby Default...${normal}"
rbenv global $(rbenv install -l | grep -v - | tail -1)

echo -e "${HR}"
echo -e "${bold}Installing Ruby Gems...${normal}"
gem install ${GEMS[@]}

echo -e "${HR}"
echo -e "${bold}RBENV doctor...${normal}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

echo -e "${HR}"
echo -e "${bold}Cloning && Building AUR Repos...${normal}"
pamac clone ${AUR_REPOS[@]}
pamac build ${AUR_REPOS[@]}

echo -e "${HR}"
echo -e "${bold}Installing PACMAN Packages...${normal}"
sudo pacman -S ${PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}Installing Gems...${normal}"
sudo gem install ${GEMS[@]}

echo -e "${HR}"
echo -e "${bold}Installing NPM Packages...${normal}"
npm i -g ${GLOBAL_NPM_PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}Installing PAMAC Packages...${normal}"
pamac install ${PAMAC_PACKAGES[@]}

echo -e "${HR}Installing Neovim Python Providers...${HR}"
echo -e "${HR}"
echo -e "${bold}Installing NeoVIM Python Provider...${normal}"
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim

