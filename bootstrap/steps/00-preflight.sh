#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"

STEP="preflight"
is_done "$STEP" && exit 0

[[ "$(uname -s)" == "Darwin" ]] || {
    log_error "macOS required"
    exit 1
}
[[ "$(uname -m)" == "arm64" ]] || log_warn "Not running on Apple Silicon"

xcode-select -p >/dev/null 2>&1 || {
    log_info "Installing Xcode CLI tools..."
    xcode-select --install
}

mark_done "$STEP"
