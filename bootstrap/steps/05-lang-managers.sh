#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"
source "$(dirname "$0")/../lib/brew.sh"
source "$(dirname "$0")/../lib/nvm.sh"
source "$(dirname "$0")/../lib/rbenv.sh"
source "$(dirname "$0")/../lib/pyenv.sh"
source "$(dirname "$0")/../lib/fzf.sh"

STEP="lang-managers"
is_done "$STEP" && exit 0

ensure_brew
ensure_fzf
ensure_nvm
ensure_rbenv
ensure_pyenv

mark_done "$STEP"
