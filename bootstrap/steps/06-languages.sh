#!/usr/bin/env bash

source .../nvm.sh
source .../rbenv.sh
source .../pyenv.sh

ensure_nvm
ensure_rbenv
ensure_pyenv

nvm install --lts
rbenv install -s 3.3.2
rbenv global 3.3.2
pyenv install -s 3.12.2
pyenv global 3.12.2
