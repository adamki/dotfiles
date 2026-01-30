#!/usr/bin/env bash

ensure_fzf() {
    if [[ ! -d "$HOME/.fzf" ]]; then
        log_info "Installing fzf..."

        git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
        "$HOME/.fzf/install" --all
    fi
}
