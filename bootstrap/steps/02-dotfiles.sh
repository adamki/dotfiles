#!/usr/bin/env bash

set -euo pipefail

# -----------------------------
# Bootstrap: Dotfiles
# -----------------------------
# This script:
# 1. Backs up existing root-level dotfiles (.vimrc, .zshrc, etc.) and .config files
# 2. Symlinks root-level dotfiles into $HOME
# 3. Recursively symlinks all files under dotfiles/.config into $HOME/.config
# 4. Ignores the .git directory
# -----------------------------

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
=======
# -----------------------------
# Root-level dotfiles
# -----------------------------
ROOT_FILES=(
    ".zshrc"
    ".vimrc"
    ".gitignore_global"
    ".rgignore"
)

log_step "Linking root-level dotfiles"
for f in "${ROOT_FILES[@]}"; do
    src="$DOTFILES_DIR/$f"
    dst="$HOME/$f"
    [[ -e "$src" ]] && backup_and_link "$src" "$dst"
done

# -----------------------------
# Recursive .config symlinks
# -----------------------------
log_step "Linking .config directory recursively"

CONFIG_SRC="$DOTFILES_DIR/.config"
CONFIG_DST="$HOME/.config"

if [[ -d "$CONFIG_SRC" ]]; then
    while IFS= read -r -d '' file; do
        rel_path="${file#$CONFIG_SRC/}"
        src="$file"
        dst="$CONFIG_DST/$rel_path"
        backup_and_link "$src" "$dst"
    done < <(find "$CONFIG_SRC" -type f -print0)
fi

log_success "Dotfiles symlinking complete!"
mark_done "$STEP"
