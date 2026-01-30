#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"

STEP="dotfiles"
is_done "$STEP" && exit 0

DOTFILES="$HOME/dotfiles"
BACKUP="$HOME/dotfiles_old"

FILES=(
    .vimrc
    .zshrc
    .rgignore
    .gitignore_global
    .config/nvim/init.lua
    .config/nvim/stylua.toml
    .config/bat/config
    .config/wezterm/wezterm.lua
)

log_info "Backing up existing dotfiles..."
for f in "${FILES[@]}"; do
    if [[ -f "$HOME/$f" || -L "$HOME/$f" ]]; then
        mkdir -p "$BACKUP/$(dirname "$f")"
        mv "$HOME/$f" "$BACKUP/$f"
    fi
done

log_info "Symlinking dotfiles..."
for f in "${FILES[@]}"; do
    mkdir -p "$(dirname "$HOME/$f")"
    ln -sf "$DOTFILES/$f" "$HOME/$f"
done

mark_done "$STEP"
