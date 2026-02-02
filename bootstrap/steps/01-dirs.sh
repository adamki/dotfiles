#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"

STEP="dirs"
is_done "$STEP" && exit 0

BACKUP_DIR="$HOME/dotfiles_old"

log_step "Creating backup directory..."
mkdir -p "$BACKUP_DIR"

log_success "Backup directory ready at $BACKUP_DIR"
mark_done "$STEP"
