autoload colors && colors

source "/opt/homebrew/opt/zsh-git-prompt/zshrc.sh"
[[ -e /opt/homebrew/opt/kube-ps1/share/kube-ps1.sh ]] && source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"

PROMPT='%B%m:%25<...<%~%<<%b %# '

function aws_profile {
  if [ -v AWS_PROFILE ]; then
    echo "[aws: ${AWS_PROFILE}]"
  fi
}

RPROMPT='$(aws_profile)'
