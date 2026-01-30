#!/usr/bin/env bash

set -euo pipefail

source .../brew.sh
source .../nvm.sh
source .../rbenv.sh
source .../pyenv.sh

ensure_brew
ensure_nvm
ensure_rbenv
ensure_pyenv
