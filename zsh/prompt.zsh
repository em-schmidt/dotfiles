autoload colors && colors

source "/usr/local/opt/zsh-git-prompt/zshrc.sh"
PROMPT='%B%m:%25<...<%~%<<%b$(git_super_status) %# '

function aws_profile {
  if [ -v AWS_PROFILE ]; then
    echo "[aws: ${AWS_PROFILE}]"
  fi
}

RPROMPT='$(aws_profile)'
