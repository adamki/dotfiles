#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"

STEP="postflight"

is_done "$STEP" && exit 0

ZSH_PATH="$(command -v zsh || true)"

if [[ -n "$ZSH_PATH" && "$SHELL" != "$ZSH_PATH" ]]; then
    log_warn "Default shell is not zsh."
    log_info "To change it, run:"
    echo
    echo "  chsh -s $ZSH_PATH"
    echo
    log_info "Then log out and back in."
else
    log_success "Default shell already set to zsh"
fi

git config --global core.excludesfile "$HOME/.gitignore_global"
log_info "Setting global git excludesfile"

log_success "Bootstrap finished successfully 🎉"
mark_done "$STEP"
