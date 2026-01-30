#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "$0")/../lib/logging.sh"
source "$(dirname "$0")/../lib/state.sh"
source "$(dirname "$0")/../lib/nvm.sh"
source "$(dirname "$0")/../ib/rbenv.sh"
source "$(dirname "$0")/../lib/pyenv.sh"

STEP="languages"
is_done "$STEP" && exit 0

ensure_nvm
ensure_rbenv
ensure_pyenv

log_info "Installing Node (latest LTS)..."
nvm install --lts
nvm alias default lts/*

log_info "Installing Ruby 3.3.2..."
rbenv install -s 3.3.2
rbenv global 3.3.2
rbenv rehash

log_info "Installing Python 3.12.2..."
pyenv install -s 3.12.2
pyenv global 3.12.2
pyenv rehash

mark_done "$STEP"
