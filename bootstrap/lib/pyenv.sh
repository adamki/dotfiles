#!/usr/bin/env bash

source "$(dirname "$0")/../lib/brew.sh"

# Install pyenv
ensure_pyenv() {
    ensure_brew
    brew list pyenv >/dev/null 2>&1 || brew install pyenv
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
}
