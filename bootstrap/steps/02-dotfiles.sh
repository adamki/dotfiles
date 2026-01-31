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

mkdir -p "$BACKUP_DIR"

# -----------------------------
# Helper: Backup and symlink a single file
# -----------------------------
backup_and_link() {
    local src="$1"
    local dst="$2"

    # Skip .git dirs
    [[ "$(basename "$src")" == ".git" ]] && return

    # Create parent directory of destination if needed
    mkdir -p "$(dirname "$dst")"

    # Backup existing file if it exists and is not a symlink to the same source
    if [[ -e "$dst" && ! -L "$dst" ]]; then
        local backup_path="$BACKUP_DIR${dst#$HOME}"
        mkdir -p "$(dirname "$backup_path")"
        mv -v "$dst" "$backup_path"
        log_info "Backed up $dst -> $backup_path"
    fi

    # Create or update symlink
    if [[ ! -L "$dst" || "$(readlink "$dst")" != "$src" ]]; then
        ln -sfnv "$src" "$dst"
        log_info "Linked $dst -> $src"
    fi
}

# -----------------------------
# Link root-level dotfiles
# -----------------------------
ROOT_MANIFEST="$DOTFILES_DIR/root.txt"

if [[ -f "$ROOT_MANIFEST" ]]; then
    log_step "Linking root-level dotfiles from root.txt"
    while IFS= read -r file || [[ -n "$file" ]]; do
        [[ -z "$file" || "$file" =~ ^# ]] && continue # skip empty lines/comments
        src="$DOTFILES_DIR/$file"
        dst="$HOME/$file"
        [[ -e "$src" ]] && backup_and_link "$src" "$dst"
    done <"$ROOT_MANIFEST"
fi

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
