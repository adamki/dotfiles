#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"

STEP="dotfiles"
is_done "$STEP" && exit 0

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_old"

log_step "Backing up and symlinking dotfiles"

# Symlink root-level dotfiles (skip .git and .config)
ROOT_FILES=()
for f in "$DOTFILES_DIR"/.*; do
    base=$(basename "$f")
    [[ "$base" == "." || "$base" == ".." ]] && continue
    [[ "$base" == ".config" ]] && continue
    [[ "$base" == ".git" ]] && continue
    [[ -f "$f" ]] && ROOT_FILES+=("$base")
done

# Function to symlink a single file safely
symlink_file() {
    local src="$1"
    local dst="$2"

    if [[ -e "$dst" && ! -L "$dst" ]]; then
        # Backup existing file
        mkdir -p "$BACKUP_DIR/$(dirname "${dst#$HOME/}")"
        mv -v "$dst" "$BACKUP_DIR/${dst#$HOME/}"
    fi

    # Symlink
    ln -sfnv "$src" "$dst"
}

# Symlink root dotfiles
for file in "${ROOT_FILES[@]}"; do
    symlink_file "$DOTFILES_DIR/$file" "$HOME/$file"
done

# Recursively symlink everything in .config
CONFIG_SRC="$DOTFILES_DIR/.config"
CONFIG_DST="$HOME/.config"

if [[ -d "$CONFIG_SRC" ]]; then
    shopt -s dotglob
    for f in "$CONFIG_SRC"/*; do
        rel_path="${f#$CONFIG_SRC/}"
        dst_path="$CONFIG_DST/$rel_path"

        if [[ -d "$f" ]]; then
            mkdir -p "$dst_path"
            continue
        fi

        mkdir -p "$(dirname "$dst_path")"
        symlink_file "$f" "$dst_path"
    done
fi

log_success "Dotfiles mirrored successfully"
mark_done "$STEP"
