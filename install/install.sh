#!/bin/bash
# Setup PATHS
INSTALL_DIR="~/dotfiles/install"

BOOTSTRAP_MAC="${INSTALL_DIR}/bootstrap_mac.sh"
SYMLINK_MAC="${INSTALL_DIR}/makesymlinks_mac.sh"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  . ./install/bootstrap_linux.sh
  . ./install/makesymlinks_linux.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  . "$BOOTSTRAP_MAC"
  . "$SYMLINK_MAC"
fi
