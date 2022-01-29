autoload colors && colors


# git status prompt bits
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats " (%b|%c%u)"
zstyle ':vcs_info:git*' actionformats " (%b|%a%c%u)"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '✚'
zstyle ':vcs_info:*' stagedstr '•'
zstyle ':vcs_info:*+set-message:*' hooks git-untracked

+vi-git-untracked() {
if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == 'true' ]] && \
  git status --porcelain | grep -q '^?? ' 2>/dev/null ; then
  untracked_count=$(git status --porcelain |  grep -c '^?? ')
    hook_com[staged]+="…${untracked_count}"
fi
}

precmd() {
  vcs_info
}

setopt prompt_subst

[[ -e ${BREWPATH}/opt/kube-ps1/share/kube-ps1.sh ]] && source "${BREWPATH}/opt/kube-ps1/share/kube-ps1.sh"

PROMPT='%B%m:%25<...<%~%<<%b${vcs_info_msg_0_} %# '

function aws_profile {
  if [ -v AWS_PROFILE ]; then
    echo "[☁️ :${AWS_PROFILE}]"
  fi
}

RPROMPT='$(aws_profile)|$(kube_ps1)'
