#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"
source "$(dirname "$0")/../lib/brew.sh"

STEP="shell"
is_done "$STEP" && exit 0

ensure_brew

brew list zsh >/dev/null 2>&1 || brew install zsh

log_success "Shell tools installed (zsh)"

mark_done "$STEP"
