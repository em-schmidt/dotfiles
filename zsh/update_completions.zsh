#/usr/bin/env zsh
set -o errexit nounset pipefail

COMPDIR=~/.dotfiles/zsh/functions

echo " - kubectl" \
  && test -x $(which kubectl) \
  && kubectl completion zsh > ${COMPDIR}/_kubectl

#echo " - kubectx" \
#  && test -x $(which kubectx) \
#  && curl -s https://raw.githubusercontent.com/ahmetb/kubectx/master/completion/_kubectx.zsh > ${COMPDIR}/_kubectx

#echo " - kubens" \
#  && test -x $(which kubens) \
#  && curl -s https://raw.githubusercontent.com/ahmetb/kubectx/master/completion/_kubens.zsh > ${COMPDIR}/_kubens

echo " - flux" \
  && test -x $(which flux) \
  && flux completion zsh > ${COMPDIR}/_flux

echo " - docker" \
  && test -x $(which docker) \
  && curl -s https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > ${COMPDIR}/_docker

echo " - glab" \
  && test -x $(which glab) \
  && glab completion -s zsh > ${COMPDIR}/_glab
