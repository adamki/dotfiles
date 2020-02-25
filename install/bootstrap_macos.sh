#!/bin/bash
. ./utils/colors.sh

BREW_TAPS=(
  homebrew/cask-fonts
  koekeishiya/formulae
)

BREW_PACKAGES=(
  antigen
  bat
  gotop
  htop
  python2
  ranger
  rbenv
  ripgrep
  skhd
  tmux
  yabai
  zsh
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
echo -e "${bold}Checking if Brew is installed...${normal}"
if test ! $(which brew); then
  echo -e "${HR}"
  echo -e "${bold}Brew Not Found. Installing Brew...${normal}"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "${HR}"
echo -e "${bold}Brew Update...${normal}"
brew update

echo -e "${HR}"
echo -e "${bold}Fetching Brew Taps...${normal}"
brew tap ${BREW_TAPS[@]}

echo -e "${HR}"
echo -e "${bold}Installing Brew Packages...${normal}"
brew install ${BREW_PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}Installing Brew Casks...${normal}"
brew cask install ${BREW_CASKS[@]}

echo -e "${HR}"
echo -e "${bold}Brew Cleanup...${normal}"
brew cleanup

echo -e "${HR}"
echo -e "${bold}Installing Gems...${normal}"
gem install ${RUBY_GEMS[@]}

# MISC INSTALLS
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
echo -e "${bold}Installing NVM...${normal}"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

echo -e "${HR}"
echo -e "${bold}Sourcing NVM...${normal}"
source ${HOME}/.nvm/nvm.sh
nvm --version

echo -e "${HR}"
echo -e "${bold}Installing Latest Node...${normal}"
nvm install node #"node is alway latest version"

echo -e "${HR}"
echo -e "${bold}Installing Global NPM packages...${normal}"
npm install -g ${GLOBAL_NPM_PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}RBENV doctor...${normal}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

echo -e "${HR}"
echo -e "${bold}Installing NeoVIM...${normal}"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
