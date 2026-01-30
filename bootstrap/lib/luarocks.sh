#!/usr/bin/env bash
set -euo pipefail

# Ensure LuaRocks is installed and available
ensure_luarocks() {
    ensure_brew

    if ! command -v luarocks >/dev/null 2>&1; then
        log_info "Installing LuaRocks via Homebrew..."
        brew list luarocks >/dev/null 2>&1 || brew install luarocks
    fi

    # Add LuaRocks bin to PATH (Apple Silicon safe)
    export PATH="$(brew --prefix luarocks)/bin:$PATH"

    # Confirm installation
    if ! command -v luarocks >/dev/null 2>&1; then
        log_error "LuaRocks failed to install"
        exit 1
    fi

    log_success "LuaRocks is installed: $(luarocks --version | head -n1)"
}

# Install a single LuaRocks package if not already installed
install_luarocks_package() {
    local pkg="$1"
    # Use 'luarocks list --porcelain' to reliably detect installed packages
    if ! luarocks list --porcelain | awk '{print $1}' | grep -qx "$pkg"; then
        log_info "Installing LuaRocks package: $pkg"
        luarocks install "$pkg"
    else
        log_info "LuaRocks package already installed: $pkg"
    fi
}
