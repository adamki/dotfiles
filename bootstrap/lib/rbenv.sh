#!/usr/bin/env bash

ensure_rbenv() {
    ensure_brew
    brew list rbenv >/dev/null 2>&1 || brew install rbenv
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
}
