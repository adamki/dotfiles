#!/usr/bin/env bash

STEP="packages"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# source "$(dirname "$0")/../lib/brew.sh"
# source "$(dirname "$0")/../lib/nvm.sh"
# source "$(dirname "$0")/../lib/rbenv.sh"
# source "$(dirname "$0")/../lib/pyenv.sh"
# source "$(dirname "$0")/../lib/luarocks.sh"

# -----------------------------
# Import libraries
source "$ROOT_DIR/lib/logging.sh"
source "$ROOT_DIR/lib/state.sh"
source "$ROOT_DIR/lib/brew.sh"
source "$ROOT_DIR/lib/nvm.sh"
source "$ROOT_DIR/lib/rbenv.sh"
source "$ROOT_DIR/lib/pyenv.sh"
source "$ROOT_DIR/lib/luarocks.sh"

ensure_brew
ensure_nvm
ensure_rbenv
ensure_pyenv
ensure_luarocks

# -----------------------------
# Install Brew Packages
log_step "Installing Brew packages"
while read -r pkg; do
    if ! brew list "$pkg" >/dev/null 2>&1; then
        log_info "Installing Brew package: $pkg"
        brew install "$pkg"
    else
        log_info "Brew package already installed: $pkg"
    fi
done <"$ROOT_DIR/manifests/brew.txt"

# -----------------------------
# Install Brew Casks
log_step "Installing Brew casks"
while read -r cask; do
    if ! brew list --cask "$cask" >/dev/null 2>&1; then
        log_info "Installing Brew cask: $cask"
        brew install --cask "$cask"
    else
        log_info "Brew cask already installed: $cask"
    fi
done <"$ROOT_DIR/manifests/casks.txt"

# -----------------------------
# Install global NPM packages
log_step "Installing global NPM packages"
while read -r pkg; do
    if ! npm list -g --depth=0 "$pkg" >/dev/null 2>&1; then
        log_info "Installing NPM package: $pkg"
        npm install -g "$pkg"
    else
        log_info "NPM package already installed: $pkg"
    fi
done <"$ROOT_DIR/manifests/npm.txt"

# -----------------------------
# Install Ruby gems
log_step "Installing Ruby gems"
while read -r gem; do
    if ! gem list -i "$gem" >/dev/null 2>&1; then
        log_info "Installing Ruby gem: $gem"
        gem install --no-document "$gem"
    else
        log_info "Ruby gem already installed: $gem"
    fi
done <"$ROOT_DIR/manifests/gems.txt"

# -----------------------------
# Install LuaRocks packages
log_step "Installing LuaRocks packages"
while read -r rock; do
    install_luarocks_package "$rock"
done <"$ROOT_DIR/manifests/luarocks.txt"

# -----------------------------
mark_done "$STEP"
log_success "All packages installed successfully 🎉"
