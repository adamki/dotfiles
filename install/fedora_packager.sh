#!/bin/bash
. ./utils/colors.sh

DNF_COPR_REPOS=(
  evana/fira-code-fonts
)

DNF_PACKAGES=(
  bat
  compton
  curl
  feh
  fira-code-fonts
  firefox
  htop
  i3
  neovim
  nitrogen
  python2
  python3
  ranger
  ripgrep
  rofi
  timeshift
  tmux
  xcape
  xclip
  pulseaudio-utils
  brightnessctl
  xrandr
  arandr
  ImageMagick
  dbus
  lxappearance
  polybar
  xfce4-power-manager
  networkmanager-tui
)


GLOBAL_NPM_PACKAGES=(
  bash-language-server
  eslint
  neovim
  vim-language-server
)

RUBY_GEMS=(
  bundler
  neovim
  lolcat
)

# All of this is needed for ruby
sudo dnf install git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel

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
echo -e "${bold}Installing NPM Packages...${normal}"
npm i -g ${GLOBAL_NPM_PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}Installing DNF Packages...${normal}"
sudo dnf install ${DNF_PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}Installing NeoVIM Python Provider...${normal}"
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim

echo -e "${HR}"
echo -e "${bold}Installing COPR Packages...${normal}"
sudo dnf copr enable ${DNF_COPR_REPOS[@]}

echo -e "${HR}"
echo -e "${bold}Getting NeoVIM appimage...${normal}"
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
mv -v ./nvim.appimage ~/nvim.appimage
chmod u+x ~/nvim.appimage

echo -e "${HR}"
echo -e "${bold}${green}Packager Complete...${normal}"
