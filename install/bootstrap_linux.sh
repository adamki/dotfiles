#!/bin/bash
echo "Starting bootstrapping"
# install

echo "Updating pacman..."
sudo pacman -Syu

THINGS=(
  xcape
  zsh
  neofetch
  ripgrep
  fzf
  tmux
  ranger
  gotop
  htop
  rbenv
  firefox
  rubygems
)

echo "Installing packages..."
sudo pacman -S ${THINGS[@]}

FONTS=(
  otf-fira-code
)

echo "Installing fonts..."
sudo pacman -S ${FONTS[@]}

GEMS=(
  lolcat
  bundler
)

echo "Installing GEMS..."
sudo gem install ${GEMS[@]}

# MISC INSTALLS
echo "Installing Kitty Terminal..."
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

echo "Installing Antigen..."
curl -L git.io/antigen > antigen.zsh

echo "Installing TPM..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | zsh
nvm --version  # check for proper install
nvm install node

echo "Setting up Ruby..."
rbenv install [arg]
rbenv global [arg]
