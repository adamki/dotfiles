#!/usr/bin/env bash

ensure_brew() {
    local brew_bin="/opt/homebrew/bin/brew"

    if [[ ! -x "$brew_bin" ]]; then
        log_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    eval "$($brew_bin shellenv)"
}

# Install a brew package idempotently
ensure_brew_package() {
    local pkg="$1"

    ensure_brew

    if ! brew list "$pkg" >/dev/null 2>&1; then
        echo "Installing Brew package: $pkg"
        brew install "$pkg"
    else
        echo "Brew package already installed: $pkg"
    fi

    # Evaluate brew shellenv so PATH, HOMEBREW_PREFIX, etc. are set
    eval "$(/opt/homebrew/bin/brew shellenv)"
}

# Install a brew cask idempotently
ensure_brew_cask() {
    local cask="$1"

    ensure_brew

    if ! brew list --cask "$cask" >/dev/null 2>&1; then
        echo "Installing Brew cask: $cask"
        brew install --cask "$cask"
    else
        echo "Brew cask already installed: $cask"
    fi
}
