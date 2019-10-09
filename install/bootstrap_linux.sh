#!/bin/bash
. ./utils/colors.sh
# install

echo -e "${HR}Starting Boostrap Script...\n\nUpdating Pacman${reset}${HR}"
sudo pacman-mirrors --fasttrack && sudo pacman -Syyu

PAMAC_REPOS="
  rbenv
  gotop
  neovim-nightly
"
pamac clone $PAMAC_REPOS
pamac build $PAMAC_REPOS

PAMAC_PACKAGES=(
  lolcat
  feh
)

pamac install ${PAMAC_PACKAGES[0]}

PACKAGES=(
  xcape
  zsh
  neofetch
  ripgrep
  fzf
  tmux
  ranger
  htop
  firefox
  rubygems
  i3-gaps
  rofi
  compton
  nitrogen
)

echo -e "${HR}Installing Packages...${HR}"
sudo pacman -S ${PACKAGES[@]}

FONTS=(
  otf-fira-code
)

echo -e "${HR}Installing Fonts...${HR}"
sudo pacman -S ${FONTS[@]}

GEMS=(
  bundler
)

echo -e "${HR}Installing Gems...${HR}"
sudo gem install ${GEMS[@]}

echo -e "${hr}Installing Plug...${hr}"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo -e "${hr}installing kitty terminal...${hr}"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
echo -e "${HR}Installing TPM...${HR}"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Installing Antigen..."
curl -L git.io/antigen > ~/antigen.zsh
echo -e "${HR}Installing NVM...${HR}"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | zsh
echo -e "${HR}Checking NVM version...${HR}"
source ${HOME}/.nvm/nvm.sh
nvm --version
echo -e "${HR}Installing Latest Node...${HR}"
nvm install node #"node is alway latest version"
echo -e "${HR}Check rbenv installation...${HR}"
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
# rbenv install $(rbenv install -l | grep -v - | tail -1)
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
echo -e "${HR}Installing Neovim Python Providers...${HR}"
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim
echo -e "${HR}Set up FZF keymappings...${HR}"
~/.fzf/install
echo -e "${HR}Set default shell to Zsh...${HR}"
chsh -s $(which zsh)
echo -e "${HR}\nBootstrap Complete!\n${HR}"
