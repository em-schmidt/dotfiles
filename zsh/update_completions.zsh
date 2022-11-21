#/usr/bin/env zsh
set -o errexit nounset pipefail

COMPDIR=~/.dotfiles/zsh/functions

echo " - kubectl"
test -x $(which kubectl) && kubectl completion zsh > ${COMPDIR}/_kubectl


echo " - flux"
test -x $(which flux) && flux completion zsh > ${COMPDIR}/_flux
