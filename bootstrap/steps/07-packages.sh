#!/usr/bin/env bash

source "$(dirname "$0")/../lib/brew.sh"
source "$(dirname "$0")/../lib/nvm.sh"
source "$(dirname "$0")/../lib/rbenv.sh"
source "$(dirname "$0")/../lib/pyenv.sh"

ensure_brew
ensure_nvm
ensure_rbenv
ensure_pyenv

xargs brew install <manifests/brew.txt
xargs brew install --cask <manifests/casks.txt
xargs npm install -g <manifests/npm.txt
xargs gem install --no-document <manifests/gems.txt
xargs luarocks install <manifests/luarocks.txt
