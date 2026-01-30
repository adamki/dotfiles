#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"
source "$(dirname "$0")/../lib/brew.sh"

STEP="shell"
is_done "$STEP" && exit 0

ensure_brew

brew list zsh >/dev/null 2>&1 || brew install zsh

if [[ ! -f "$HOME/antigen.zsh" ]]; then
    curl -L git.io/antigen >"$HOME/antigen.zsh"
fi

if [[ "$SHELL" != "$(which zsh)" ]]; then
    chsh -s "$(which zsh)"
fi

mark_done "$STEP"
