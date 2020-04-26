#!/bin/bash
. ./utils/colors.sh

AUR_REPOS=(
  gotop
  neovim-nightly
)

PAMAC_PACKAGES=(
  feh
)

PACMAN_PACKAGES=(
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
  xclip
  libpulse
  brightnessctl
  xrandr
  arandr
  scrot
  imagemagick
  dbus
  lxappearance-gtk
)

RUBY_GEMS=(
  bundler
  neovim
  lolcat
)

GLOBAL_NPM_PACKAGES=(
  bash-language-server
  eslint
  neovim
  vim-language-server
)

echo -e "${HR}"
echo -e "${bold}Installing NPM Packages...${normal}"
# npm i -g ${GLOBAL_NPM_PACKAGES[@]}
npm i -g bash-language-server
npm i -g eslint
npm i -g neovim
npm i -g vim-language-server

echo -e "${HR}"
echo -e "${bold}Installing NeoVIM Python Provider...${normal}"
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim

echo -e "${HR}"
echo -e "${bold}Cloning && Building AUR Repos...${normal}"
pamac build --no-confirm ${AUR_REPOS[@]}

echo -e "${HR}"
echo -e "${bold}Installing PAMAC Packages...${normal}"
pamac install ${PAMAC_PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}Installing PACMAN Packages...${normal}"
sudo pacman -S ${PACMAN_PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}Installing Latest Ruby...${normal}"
rbenv install $(rbenv install -l | grep -v - | tail -1)

echo -e "${HR}"
echo -e "${bold}Setting Ruby Default...${normal}"
rbenv global $(rbenv install -l | grep -v - | tail -1)

echo -e "${HR}"
echo -e "${bold}Installing Ruby Gems...${normal}"
gem install ${RUBY_GEMS[@]}

echo -e "${HR}"
echo -e "${bold}RBENV doctor...${normal}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

echo -e "${HR}"
echo -e "${bold}${green}Packager Complete...${normal}"
