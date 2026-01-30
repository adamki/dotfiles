#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/../lib/brew.sh"

ensure_luarocks() {
    ensure_brew

    if ! command -v luarocks >/dev/null 2>&1; then
        log_info "Installing LuaRocks via Homebrew..."
        brew list luarocks >/dev/null 2>&1 || brew install luarocks
    fi

    # Ensure PATH has luarocks binary
    eval "$(brew --prefix luarocks)/bin/luarocks path --bin)"

    command -v luarocks >/dev/null 2>&1 || {
        log_error "LuaRocks failed to install"
        exit 1
    }

    log_success "LuaRocks is installed: $(luarocks --version)"
}

install_luarocks_package() {
    local pkg="$1"
    if ! luarocks list | grep -q "^$pkg"; then
        log_info "Installing LuaRocks package: $pkg"
        luarocks install "$pkg"
    else
        log_info "LuaRocks package already installed: $pkg"
    fi
}
