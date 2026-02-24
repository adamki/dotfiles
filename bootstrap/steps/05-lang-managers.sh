#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"
source "$(dirname "$0")/../lib/brew.sh"
source "$(dirname "$0")/../lib/fzf.sh"
source "$(dirname "$0")/../lib/asdf.sh"

STEP="lang-managers"
is_done "$STEP" && exit 0

ensure_brew
ensure_fzf

# asdf: install via brew so it's available for plugins and step 06
ensure_brew_package asdf
ensure_asdf
asdf_ensure_plugin nodejs
asdf_ensure_plugin ruby
asdf_ensure_plugin python

mark_done "$STEP"
