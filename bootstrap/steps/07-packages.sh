#!/usr/bin/env bash

source .../brew.sh
source .../nvm.sh
source .../rbenv.sh

ensure_brew
ensure_nvm
ensure_rbenv

xargs brew install <manifests/brew.txt
xargs brew install --cask <manifests/casks.txt
xargs npm install -g <manifests/npm.txt
xargs gem install --no-document <manifests/gems.txt
xargs luarocks install <manifests/luarocks.txt
