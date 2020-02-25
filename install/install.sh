#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  . ./install/linux_variables.sh
  . ./install/symlink.sh
  if [ -f /etc/debian_version ]; then
    . ./install/debian_bootstrapper.sh
  elif [ -f "/etc/arch-release" ]; then
    . ./install/arch_bootstrapper.sh
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  . ./install/macos_variables.sh
  . ./install/symlink.sh
  . ./install/macos_bootstrapper.sh
fi
