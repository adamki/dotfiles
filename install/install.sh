#!/bin/bash
# Setup PATHS
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  if [ -f /etc/debian_version ]; then
    . ./install/bootstrap_debian.sh
  fi
  if [ -f "/etc/arch-release" ]; then
    . ./install/bootstrap_linux.sh
  fi
  . ./install/makesymlinks_linux.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  . ./install/bootstrap_mac.sh
  . ./install/makesymlinks_mac.sh
fi
