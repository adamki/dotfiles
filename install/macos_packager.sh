#!/bin/bash
set -euo pipefail
. ./utils/colors.sh

HR="=============================="

# -----------------------------
# Configuration arrays
BREW_TAPS=()

BREW_PACKAGES=(
    antigen
    bat
    pyenv
    ripgrep
    neovim
    starship
    luarocks
)

BREW_CASKS=(
    wezterm
    # firefox
    # rectangle
    # slack
)

GLOBAL_NPM_PACKAGES=(
    bash-language-server
    eslint
    neovim
    vim-language-server
    @shopify/cli@latest
)

RUBY_GEMS=(
    bundler
    lolcat
    neovim
)

LUAROCKS=(
    luacheck
)

# -----------------------------
# Ruby / rbenv
echo -e "${HR}\n${bold}Initializing rbenv...${normal}"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

RUBY_VERSION="3.3.2"
if ! rbenv versions | grep -q "$RUBY_VERSION"; then
    echo -e "${bold}Installing Ruby $RUBY_VERSION via rbenv...${normal}"
    rbenv install -s "$RUBY_VERSION"
else
    echo -e "${bold}Ruby $RUBY_VERSION already installed${normal}"
fi
rbenv global "$RUBY_VERSION"
rbenv rehash

echo -e "${bold}Using Ruby version: $(ruby -v)${normal}"

echo -e "${HR}\n${bold}Installing Ruby gems...${normal}"
for gem in "${RUBY_GEMS[@]}"; do
    if ! gem list -i "$gem" >/dev/null 2>&1; then
        echo -e "Installing gem: $gem"
        gem install --no-document "$gem"
    else
        echo -e "Gem already installed: $gem"
    fi
done

# -----------------------------
# Python / pyenv
# echo -e "${HR}\n${bold}Initializing pyenv...${normal}"
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"

PYTHON_VERSION="3.12.2"
# if ! pyenv versions | grep -q "$PYTHON_VERSION"; then
#     echo -e "${bold}Installing Python $PYTHON_VERSION via pyenv...${normal}"
#     pyenv install -s "$PYTHON_VERSION"
# else
#     echo -e "${bold}Python $PYTHON_VERSION already installed${normal}"
# fi
# pyenv global "$PYTHON_VERSION"
# pyenv rehash
#
echo -e "${bold}Using Python version: $(python3 --version)${normal}"

# echo -e "${HR}\n${bold}Installing pynvim for Python...${normal}"
# python3 -m pip install --user --upgrade pynvim

# -----------------------------
# Global NPM packages
echo -e "${HR}\n${bold}Installing global NPM packages...${normal}"
for pkg in "${GLOBAL_NPM_PACKAGES[@]}"; do
    if ! npm list -g --depth=0 "$pkg" >/dev/null 2>&1; then
        echo -e "Installing NPM package: $pkg"
        npm install -g "$pkg"
    else
        echo -e "NPM package already installed: $pkg"
    fi
done

# -----------------------------
# Brew
if command -v brew >/dev/null 2>&1; then
    eval "$($(brew --prefix)/bin/brew shellenv)"
else
    echo -e "${bold}Homebrew not found. Please install Homebrew first.${normal}"
    exit 1
fi

# echo -e "${HR}\n${bold}Fetching Brew taps...${normal}"
# for tap in "${BREW_TAPS[@]}"; do
#     if ! brew tap | grep -q "^$tap\$"; then
#         echo -e "Tapping $tap"
#         brew tap "$tap"
#     else
#         echo -e "Tap already exists: $tap"
#     fi
# done

echo -e "${HR}\n${bold}Installing Brew packages...${normal}"
for pkg in "${BREW_PACKAGES[@]}"; do
    if ! brew list "$pkg" >/dev/null 2>&1; then
        echo -e "Installing Brew package: $pkg"
        brew install "$pkg"
    else
        echo -e "Brew package already installed: $pkg"
    fi
done

echo -e "${HR}\n${bold}Installing Brew casks...${normal}"
for cask in "${BREW_CASKS[@]}"; do
    if ! brew list --cask "$cask" >/dev/null 2>&1; then
        echo -e "Installing Brew cask: $cask"
        brew install --cask "$cask"
    else
        echo -e "Brew cask already installed: $cask"
    fi
done

echo -e "${HR}\n${bold}Cleaning up Brew...${normal}"
brew cleanup

# -----------------------------
# LuaRocks
echo -e "${HR}\n${bold}Installing LuaRocks packages...${normal}"
for rock in "${LUAROCKS[@]}"; do
    if ! luarocks list | grep -q "$rock"; then
        echo -e "Installing LuaRocks package: $rock"
        luarocks install "$rock"
    else
        echo -e "LuaRocks package already installed: $rock"
    fi
done

# -----------------------------
echo -e "${HR}\n${bold}${green}Setup Complete!${normal}"
