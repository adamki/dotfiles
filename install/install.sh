#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  if [ -f /etc/debian_version ]; then
    . ./install/bootstrap_debian.sh
    . ./install/symlink.sh
    . ./install/linux_variables.sh
  elif [ -f "/etc/arch-release" ]; then
    . ./install/linux_variables.sh
    . ./install/symlink.sh
    . ./install/linux_bootstrapper.sh
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  . ./install/macos_variables.sh
  . ./install/symlink.sh
  . ./install/macos_bootstrapper.sh
fi
