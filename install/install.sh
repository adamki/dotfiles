#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # . ./install/linux_variables.sh
  # . ./install/symlink.sh
  if [ -f /etc/debian_version ]; then
    echo "DEBIan"
    # . ./install/debian_bootstrapper.sh
  elif [ -f "/etc/arch-release" ]; then
    echo "ARCH"
    # . ./install/arch_bootstrapper.sh
  elif [ -f "/etc/fedora-release" ]; then
    echo "FEDORA"
    # . ./install/fedora_bootstrapper.sh
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "MAC"
  # . ./install/macos_variables.sh
  # . ./install/symlink.sh
  # . ./install/macos_bootstrapper.sh
fi
