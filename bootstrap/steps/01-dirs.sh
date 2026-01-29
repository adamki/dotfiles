#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"

STEP="dirs"
is_done "$STEP" && exit 0

DOTFILES="$HOME/dotfiles"
BACKUP="$HOME/dotfiles_old"

DIRS=(
    "$BACKUP"
    "$HOME/.config/bat"
    "$HOME/.config/nvim/lua/configs"
    "$HOME/.config/wezterm"
)

log "Creating directories..."
for d in "${DIRS[@]}"; do
    mkdir -p "$d"
done

mark_done "$STEP"
