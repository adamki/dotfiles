#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"
source "$(dirname "$0")/../lib/asdf.sh"

STEP="languages"
is_done "$STEP" && exit 0

ensure_asdf

log_info "Installing Node (LTS 20.x)..."
asdf_ensure_version nodejs "20.18.0"

log_info "Installing Ruby 3.3.2..."
asdf_ensure_version ruby "3.3.2"

log_info "Installing Python 3.12.2..."
asdf_ensure_version python "3.12.2"

mark_done "$STEP"
