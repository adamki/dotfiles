#!/bin/bash
# Setup PATHS
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  . ./install/bootstrap_linux.sh
  . ./install/makesymlinks_linux.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  . ./install/bootstrap_mac.sh
  . ./install/makesymlinks_mac.sh
fi
