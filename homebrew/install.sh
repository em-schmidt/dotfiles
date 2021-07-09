#!/bin/sh
#
# Homebrew
#
# This checks for a homebrew install and installs it if not found

if ! which brew > /dev/null
then
  echo "  Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

