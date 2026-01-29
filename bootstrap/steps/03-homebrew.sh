#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"

STEP="shell"
is_done "$STEP" && exit 0

# install brew
brew list zsh >/dev/null 2>&1 || brew install zsh

# install antigen
if [[ ! -f "$HOME/antigen.zsh" ]]; then
    curl -L git.io/antigen >"$HOME/antigen.zsh"
fi

# set ZSH as default shell
if [[ "$SHELL" != "$(which zsh)" ]]; then
    chsh -s "$(which zsh)"
fi

mark_done "$STEP"
