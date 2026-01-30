#!/usr/bin/env bash

set -euo pipefail
source "$(dirname "$0")/../lib/logging.sh"

[[ "$(uname -s)" == "Darwin" ]] || {
    log_error "macOS required"
    exit 1
}
[[ "$(uname -m)" == "arm64" ]] || log_warn "Not running on Apple Silicon"

xcode-select -p >/dev/null 2>&1 || {
    log_info "Installing Xcode CLI tools..."
    xcode-select --install
}
