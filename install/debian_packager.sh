#! /bin/bash
. ./utils/colors.sh

APT_PACKAGES=(
  compton
  feh
  fonts-firacode
  htop
  i3
  nitrogen
  python3-pip
  ranger
  ripgrep
  rofi
  ruby-neovim
  timeshift
  tmux
  w3m-img
  xcape
  xclip
  pulseaudio-utils
  brightnessctl
  x11-xserver-utils
  arandr
  scrot
  imagemagick
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
  lolcat
  neovim
)

# was having issues installing a ruby
sudo apt-get purge libssl-dev
sudo apt-get install libssl-dev

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
echo -e "${bold}Installing NeoVIM Python Provider...${normal}"
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim

echo -e "${HR}"
echo -e "${bold}Installing APT Packages...${normal}"
sudo apt-get install ${APT_PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}Getting NeoVIM appimage...${normal}"
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
mv -v ./nvim.appimage ~/nvim.appimage
chmod u+x ~/nvim.appimage

echo -e "${HR}"
echo -e "${bold}${green}Packager Complete...${normal}"
