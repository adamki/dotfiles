#!/bin/bash
# Setup PATHS
INSTALL_DIR="~/dotfiles/install"

BOOTSTRAP_MAC="${INSTALL_DIR}/bootstrap_mac.sh"
SYMLINK_MAC="${INSTALL_DIR}/makesymlinks_mac.sh"

BOOTSTRAP_LINUX="${INSTALL_DIR}/bootstrap_linux.sh"
SYMLINK_LINUX="${INSTALL_DIR}/makesymlinks_linux.sh"

. "~/dotfiles/utils/colors.sh"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  . "$BOOTSTRAP_LINUX"
  . "$SYMLINK_LINUX"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  . "$BOOTSTRAP_MAC"
  . "$SYMLINK_MAC"
fi
