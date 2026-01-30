#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"

STEP="brew"
is_done "$STEP" && exit 0

BREW_BIN="/opt/homebrew/bin/brew"

if [[ ! -x "$BREW_BIN" ]]; then
    log_info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    log_info "Homebrew already installed"
fi

eval "$($BREW_BIN shellenv)"

log_info "Updating Homebrew..."
brew update

mark_done "$STEP"
