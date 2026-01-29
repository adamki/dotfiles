#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$ROOT/lib/logging.sh"
source "$ROOT/lib/state.sh"

for step in "$ROOT"/steps/*.sh; do
    log_info "▶ Running $(basename "$step")"
    bash "$step"
done

log_success "Bootstrap complete 🎉"
