autoload colors && colors

source "/usr/local/opt/zsh-git-prompt/zshrc.sh"
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"

PROMPT='%B%m:%25<...<%~%<<%b$(git_super_status) %# '

function aws_profile {
  if [ -v AWS_PROFILE ]; then
    echo "[aws: ${AWS_PROFILE}]"
  fi
}

RPROMPT='$(kube_ps1) $(aws_profile)'
