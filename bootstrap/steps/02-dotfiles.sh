#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"

STEP="dotfiles"
is_done "$STEP" && exit 0

DOTFILES_CONFIG_DIR="$HOME/dotfiles/config" # only link files from here
BACKUP_DIR="$HOME/dotfiles_old"

log_step "Backing up and symlinking dotfiles from config/..."

mkdir -p "$BACKUP_DIR"

# Recursive function to symlink files from config/
link_dotfiles_config() {
    local src="$1"
    local dst="$2"

    if [[ -d "$src" ]]; then
        mkdir -p "$dst"
        for f in "$src"/*; do
            link_dotfiles_config "$f" "$dst/$(basename "$f")"
        done
    else
        # Backup real files
        if [[ -e "$dst" && ! -L "$dst" ]]; then
            mkdir -p "$(dirname "$BACKUP_DIR/${dst#$HOME/}")"
            mv -v "$dst" "$BACKUP_DIR/${dst#$HOME/}"
        fi

        # Symlink file if missing or points somewhere else
        if [[ ! -L "$dst" || "$(readlink "$dst")" != "$src" ]]; then
            ln -sfnv "$src" "$dst"
        fi
    fi
}

# Mirror only dotfiles/config -> $HOME
link_dotfiles_config "$DOTFILES_CONFIG_DIR" "$HOME"

log_success "Dotfiles from config/ mirrored successfully"
mark_done "$STEP"
