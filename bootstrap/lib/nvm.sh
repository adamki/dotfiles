#!/usr/bin/env bash

# Install NVM
ensure_nvm() {
    export NVM_DIR="$HOME/.nvm"

    if [[ ! -d "$NVM_DIR" ]]; then
        log_info "Installing nvm..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    fi

    # shellcheck source=/dev/null
    [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

    command -v nvm >/dev/null 2>&1 || {
        log_error "nvm failed to load"
        exit 1
    }
}
