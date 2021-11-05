autoload colors && colors

source "${BREWPATH}/opt/zsh-git-prompt/zshrc.sh"
[[ -e ${BREWPATH}/opt/kube-ps1/share/kube-ps1.sh ]] && source "${BREWPATH}/opt/kube-ps1/share/kube-ps1.sh"

PROMPT='%B%m:%25<...<%~%<<%b$(git_super_status) %# '

function aws_profile {
  if [ -v AWS_PROFILE ]; then
    echo "[aws: ${AWS_PROFILE}]"
  fi
}

RPROMPT='$(aws_profile)|$(kube_ps1)'
