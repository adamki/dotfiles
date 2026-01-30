#!/usr/bin/env bash
set -euo pipefail

# ----------------------------------------
# Homebrew Utilities
# ----------------------------------------

ensure_brew() {
    if ! command -v brew >/dev/null 2>&1; then
        echo "Homebrew not found. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Apple Silicon path fix
    if [[ -d "/opt/homebrew/bin" ]]; then
        export PATH="/opt/homebrew/bin:$PATH"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
}

ensure_brew_package() {
    local pkg="$1"

    ensure_brew

    if brew list "$pkg" >/dev/null 2>&1; then
        log_info "Already installed: $pkg"
    else
        log_info "Installing: $pkg"

        if ! brew install "$pkg"; then
            log_error "Failed to install: $pkg (continuing)"
            return 1
        fi
    fi
}

ensure_brew_cask() {
    local cask="$1"

    ensure_brew

    if brew list --cask "$cask" >/dev/null 2>&1; then
        log_info "Already installed: $cask"
    else
        log_info "Installing cask: $cask"

        if ! brew install --cask "$cask"; then
            log_error "Failed to install cask: $cask (continuing)"
            return 1
        fi
    fi
}
