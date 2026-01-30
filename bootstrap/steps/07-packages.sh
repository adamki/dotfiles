#!/usr/bin/env bash

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$(dirname "$0")/../lib/brew.sh"
source "$(dirname "$0")/../lib/nvm.sh"
source "$(dirname "$0")/../lib/rbenv.sh"
source "$(dirname "$0")/../lib/pyenv.sh"

ensure_brew
ensure_nvm
ensure_rbenv
ensure_pyenv

xargs -n 1 brew install <"$ROOT_DIR/manifests/brew.txt"
xargs -n 1 brew install --cask <"$ROOT_DIR/manifests/casks.txt"
xargs -n 1 npm install -g <"$ROOT_DIR/manifests/npm.txt"
xargs -n 1 gem install <"$ROOT_DIR/manifests/gems.txt"
xargs -n 1 luarocks <"$ROOT_DIR/manifests/luarocks.txt"
