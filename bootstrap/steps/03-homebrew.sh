#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"
source "$(dirname "$0")/../lib/brew.sh"

STEP="brew"
is_done "$STEP" && exit 0

ensure_brew
brew update

mark_done "$STEP"
