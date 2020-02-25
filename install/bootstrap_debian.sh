#! /bin/bash
. ./utils/colors.sh

APT_PACKAGES=(
  bundler
  compton
  feh
  fonts-firacode
  htop
  i3
  lolcat
  nitrogen
  python-pip
  python3-pip
  ranger
  ranger
  ripgrep
  rofi
  ruby-neovim
  rubygems
  tmux
  w3m-img
  xcape
  xclip
  zsh
)

GLOBAL_NPM_PACKAGES=(
  bash-language-server
  eslint
  neovim
  vim-language-server
)

GEMS=(
  neovim
)

echo -e "${HR}"
echo -e "${bold}Updating APT...${normal}"
sudo apt-get update && sudo apt-get upgrade

echo -e "${HR}"
echo -e "${bold}Installing APT Packages...${normal}"
sudo apt-get install ${APT_PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}Getting NeoVIM appimage...${normal}"
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
mv -v ./nvim.appimage ~/nvim.appimage
chmod u+x ~/nvim.appimage

echo -e "${HR}"
echo -e "${bold}Cloning pFetch...${normal}"
git clone https://github.com/dylanaraps/pfetch.git ~/pfetch

echo -e "${HR}"
echo -e "${bold}Installing Vim-Plug...${normal}"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "${HR}"
echo -e "${bold}Installing Kitty Terminal...${normal}"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
  launch=n

echo "Installing Antigen..."
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
