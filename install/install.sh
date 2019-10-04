#!/bin/bash
# Setup PATHS
INSTALL_DIR="${DOTFILES}/install"

BOOTSTRAP_MAC="${INSTALL_DIR}/bootstrap_mac.sh"
SYMLINK_MAC="${INSTALL_DIR}/makesymlinks_mac.sh"

LINUX_INSTALL="${INSTALL_DIR}/bootstrap_linux.sh"
LINUX_SYMLINKS="${INSTALL_DIR}/makesymlinks_linux.sh"

. "${DOTFILES}/utils/colors.sh"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  echo "coming soon"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  . "$BOOTSTRAP_MAC"
  . "$SYMLINK_MAC"
fi
