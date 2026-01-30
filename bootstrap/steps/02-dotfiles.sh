#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"

STEP="dotfiles"
is_done "$STEP" && exit 0

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_old"

log_step "Backing up and symlinking dotfiles"

# Ensure backup dir exists
mkdir -p "$BACKUP_DIR"

# Recursive function to symlink files
link_dotfiles() {
    local src="$1"
    local dst="$2"

    if [[ -d "$src" ]]; then
        # It's a directory: ensure destination exists
        mkdir -p "$dst"
        for f in "$src"/*; do
            link_dotfiles "$f" "$dst/$(basename "$f")"
        done
    else
        # It's a file: backup old file if exists
        if [[ -e "$dst" && ! -L "$dst" ]]; then
            mkdir -p "$(dirname "$BACKUP_DIR/${dst#$HOME/}")"
            mv -v "$dst" "$BACKUP_DIR/${dst#$HOME/}"
        fi

        # Symlink file if it doesn't exist or points somewhere else
        if [[ ! -L "$dst" || "$(readlink "$dst")" != "$src" ]]; then
            ln -sfnv "$src" "$dst"
        fi
    fi
}

# Start linking from dotfiles root
link_dotfiles "$DOTFILES_DIR" "$HOME"

log_success "Dotfiles mirrored successfully"
mark_done "$STEP"
