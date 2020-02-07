#! /bin/bash
. ./utils/colors.sh

echo -e "${HR}Starting Boostrap Script...\n\nUpdating APT-GET${reset}${HR}"
sudo apt-get update && sudo apt-get upgrade

PACKAGES="
  ruby-neovim
  xcape
  xclip
  zsh
  ripgrep
  tmux
  ranger
  htop
  rubygems
  i3
  rofi
  compton
  nitrogen
  feh
  bundler
  fonts-firacode
  lolcat
  w3m-img
  ranger
  python-pip
  python3-pip
"

GLOBAL_NPM_PACKAGES="
  livedown
  vim-language-server
  bash-language-server
  neovim
  eslint
"

GEMS="
  neovim
"

echo -e "${HR}Installing APT GET PACKAGES...${HR}"
sudo apt-get install $PACKAGES
echo -e "${HR}Installing NVIM appimage...${HR}"
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
mv ./nvim.appimage ~/nvim.appimage
chmod u+x ~/nvim.appimage
echo -e "${hr}Cloning Pfetch...${hr}"
git clone git@github.com:dylanaraps/pfetch.git ~/pfetch
echo -e "${hr}Installing Plug...${hr}"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo -e "${hr}installing kitty terminal...${hr}"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
  launch=n
echo -e "${HR}Installing T(mux)PM...${HR}"
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
echo -e "${HR}Installing NPM Packages...${HR}"
npm i -g $GLOBAL_NPM_PACKAGES
echo -e "${HR}Installing Rbenv...${HR}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
echo -e "${HR}Installing latest ruby and setting as system default...${HR}"
rbenv install $(rbenv install -l | grep -v - | tail -1)
rbenv global $(rbenv install -l | grep -v - | tail -1)
echo -e "${HR}Installing RUBY Gems...${HR}"
gem install $GEMS
echo -e "${HR}Check rbenv installation...${HR}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
echo -e "${HR}Installing Neovim Python Providers...${HR}"
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim
echo -e "${HR}Cloning FZF...${HR}"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo -e "${HR}Building ~/.config/ranger/ files...${HR}"
ranger --copy-config=all
echo -e "${HR}Set default shell to Zsh...${HR}"
chsh -s $(which zsh)
echo -e "${HR}\nBootstrap Complete!\n${HR}"
