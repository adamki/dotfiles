#!/bin/bash
echo "Starting bootstrapping"
echo "Checking for Brew..."
# install Brew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo "Upating Brew..."
# Update homebrew recipes
brew update

PACKAGES=(
  zsh
  antigen
  neofetch
  lolcat
  ripgrep
  fzf
  tmux
  ranger
  htop
  gotop
  rbenv
  python2
)
echo "Installing packages..."
brew install ${PACKAGES[@]}
echo "Cleaning up..."
brew cleanup

CASKS=(
  firefox
  slack
)

echo "Installing cask apps..."
brew cask install ${CASKS[@]}

GEMS=(
  bundler
  neovim
)

echo "Install Gems..."
gem install ${GEMS[@]}

FONTS=(
  font-fira-code
)

echo "Installing Fonts..."
brew tap homebrew/cask-fonts
brew cask install ${FONTS[@]}

GLOBAL_NPM=(
  neovim
  livedown
)

echo 'Installing NPM Packages...'
npm install -g ${GLOBAL_NPM[@]}

# MISC INSTALLS
echo "Installing TPM..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | zsh
echo "Checking NVM Version..."
source ${HOME}/.nvm/nvm.sh
nvm --version
echo "Installing Node..."
nvm install node
echo "Checking rbenv installation..."
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
echo "installing Neovim..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "installing Neovim providers..."
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim
echo "Settings up FZF keybindings..."
/usr/local/opt/fzf/install
echo 'Setting ZSH as default!'
chsh -s $(which zsh)
echo 'Bootstrap Complete! \n You should now restart your shell.'
