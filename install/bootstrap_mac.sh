#!/bin/bash
. ./utils/colors.sh

echo -e "${HR}Starting Boostrap Script...\n\nCheck if Brew is installed${reset}${HR}"
if test ! $(which brew); then
  echo -e "${yellow}Installing Brew...${reset}"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "${yellow}Brew Found!\nUpating Brew...${reset}"
brew update

TAPS=(
  homebrew/cask-fonts
  koekeishiya/formulae
)
echo -e "\n${yellow}Fetching Brew Taps...${reset}"
brew tap ${TAPS[@]}

PACKAGES=(
  zsh
  antigen
  neofetch
  ripgrep
  tmux
  ranger
  htop
  gotop
  rbenv
  python2
  yabai
  skhd
)
echo -e "${HR}Installing Brew Packages...${HR}"
brew install ${PACKAGES[@]}

CASKS=(
  firefox
  slack
)
echo -e "${HR}Installing Brew Casks...${HR}"
brew cask install ${CASKS[@]}

FONTS=(
  font-fira-code
  font-hack-nerd-font-mono
)
echo -e "${HR}Installing Fonts...${HR}"
brew cask install ${FONTS[@]}

echo -e "${HR}Cleaning up...${HR}"
brew cleanup

GEMS=(
  lolcat
  bundler
  neovim
)
echo -e "${HR}Installing Gems...${HR}"
gem install ${GEMS[@]}

GLOBAL_NPM=(
  neovim
  livedown
  bash-language-server
)

echo -e "${HR}Installing GLOBAL NPM Packages......${HR}"
npm install -g ${GLOBAL_NPM[@]}

# MISC INSTALLS
echo -e "${hr}Installing Plug...${hr}"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo -e "${HR}Installing Kitty Terminal...${HR}"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
echo -e "${HR}Installing TPM...${HR}"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo -e "${HR}Installing NVM...${HR}"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | zsh
echo -e "${HR}Checking NVM version...${HR}"
source ${HOME}/.nvm/nvm.sh
nvm --version
echo -e "${HR}Installing Latest Node...${HR}"
nvm install node #"node is alway latest version"
echo -e "${HR}Check rbenv installation...${HR}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
echo -e "${HR}Installing Neovim...${HR}"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo -e "${HR}Installing Neovim Python Providers...${HR}"
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim
echo -e "${HR}Cloning FZF...${HR}"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo -e "${HR}Set default shell to Zsh...${HR}"
chsh -s $(which zsh)
echo -e "${HR}\nBootstrap Complete!\n${HR}"
