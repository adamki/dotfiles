#!/usr/bin/env bash

ensure_brew() {
    local brew_bin="/opt/homebrew/bin/brew"

    if [[ ! -x "$brew_bin" ]]; then
        log_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    eval "$($brew_bin shellenv)"
}
