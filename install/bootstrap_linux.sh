#!/bin/bash
. ./utils/colors.sh
# install

AUR_REPOS=(
  gotop
  neovim-nightly
)

PACMAN_PACKAGES=(
  feh
  lolcat
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
  rubygems
  timeshift
  timeshift-autosnap
  tmux
  xcape
  zsh
)

RUBY_GEMS=(
  bundler
  neovim
)

GLOBAL_NPM_PACKAGES=(
  bash-language-server
  eslint
  neovim
  vim-language-server
)

echo -e "${HR}"
echo -e "${bold}Looking for fastest Mirrors...${normal}"
# sudo pacman-mirrors --fasttrack

echo -e "${HR}"
echo -e "${bold}Updating Pacman...${normal}"
sudo pacman -Syyu

echo -e "${HR}"
echo -e "${bold}Cloning && Building AUR Repos...${normal}"
pamac clone ${AUR_REPOS[@]}
pamac build ${AUR_REPOS[@]}

echo -e "${HR}"
echo -e "${bold}Installing PACMAN Packages...${normal}"
sudo pacman -S ${PACMAN_PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}Cloning pFetch...${normal}"
git clone git@github.com:dylanaraps/pfetch.git ~/pfetch

echo -e "${HR}"
echo -e "${bold}Installing Vim-Plug...${normal}"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "${HR}"
echo -e "${bold}Installing Kitty Terminal...${normal}"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

echo -e "${HR}"
echo -e "${bold}Installing Antigen...${normal}"
curl -L git.io/antigen > ~/antigen.zsh

echo -e "${HR}"
echo -e "${bold}Installing NVM...${normal}"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | zsh

echo -e "${HR}"
echo -e "${bold}Sourcing NVM...${normal}"
source ${HOME}/.nvm/nvm.sh
nvm --version

echo -e "${HR}"
echo -e "${bold}Installing Latest Node...${normal}"
nvm install node #"node is alway latest version"

echo -e "${HR}"
echo -e "${bold}Installing NPM Packages...${normal}"
npm i -g ${GLOBAL_NPM_PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}Installing Rbenv...${normal}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

echo -e "${HR}"
echo -e "${bold}Installing Latest Ruby...${normal}"
rbenv install $(rbenv install -l | grep -v - | tail -1)

echo -e "${HR}"
echo -e "${bold}Setting Ruby Default...${normal}"
rbenv global $(rbenv install -l | grep -v - | tail -1)

echo -e "${HR}"
echo -e "${bold}RBENV doctor...${normal}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

echo -e "${HR}"
echo -e "${bold}Installing Ruby Gesm...${normal}"
gem install ${RUBY_GEMS[@]}

echo -e "${HR}"
echo -e "${bold}Installing NeoVIM Python Provider...${normal}"
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim

echo -e "${HR}"
echo -e "${bold}Installing FZF...${normal}"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo -e "${HR}"
echo -e "${bold}Changing default SHELL to FZF...${normal}"
chsh -s $(which zsh)

echo -e "${HR}"
echo -e "${bold}${green}Bootstrap Complete...${normal}"
