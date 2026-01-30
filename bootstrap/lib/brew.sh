#!/usr/bin/env bash

ensure_brew() {
    local brew_bin="/opt/homebrew/bin/brew"

    if [[ ! -x "$brew_bin" ]]; then
        log_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Only eval once per shell session
    eval "$("$brew_bin" shellenv)"
}

# Install a brew package idempotently
ensure_brew_package() {
    local pkg="$1"

    if ! brew list "$pkg" >/dev/null 2>&1; then
        log_info "Installing Brew package: $pkg"
        brew install "$pkg"
    else
        log_info "Brew package already installed: $pkg"
    fi
}

# Install a brew cask idempotently
ensure_brew_cask() {
    local cask="$1"

    if ! brew list --cask "$cask" >/dev/null 2>&1; then
        log_info "Installing Brew cask: $cask"
        brew install --cask "$cask"
    else
        log_info "Brew cask already installed: $cask"
    fi
}
