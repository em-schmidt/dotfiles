autoload colors && colors


# git status prompt bits see: https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
#
# TODO: further enhacements if needed to selectively run git commands for larer repos or automatic get fetch
#       see the zsh-users link above around line 336
#
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats " (%b|%m%c%u)"
zstyle ':vcs_info:git*' actionformats " (%b|%a%m%c%u)"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '✚'
zstyle ':vcs_info:*' stagedstr '•'
zstyle ':vcs_info:*+set-message:*' hooks git-untracked git-st

+vi-git-untracked() {
if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == 'true' ]] && \
  untracked_count=$(git status --porcelain | grep -c '^?? ') ; then
    hook_com[staged]+="…${untracked_count}"
fi
}

+vi-git-st() {
  local ahead behind
  local -a gitstatus

  # Exit early in case the worktree is on a detached HEAD
  git rev-parse ${hook_com[branch]}@{upstream} >/dev/null 2>&1 || return 0

  local -a ahead_and_behind=(
    $(git rev-list --left-right --count HEAD...${hook_com[branch]}@{upstream} 2>/dev/null)
  )

  ahead=${ahead_and_behind[1]}
  behind=${ahead_and_behind[2]}

  (( $ahead )) && gitstatus+=( "⬆ ${ahead}" )
  (( $behind )) && gitstatus+=( "⬇ ${behind}" )

  hook_com[misc]+=${(j:/:)gitstatus}
}

precmd() {
  vcs_info
}

setopt prompt_subst

zstyle ':prompt:shrink_path' fish
source ~/.dotfiles/zsh/shrink-path.zsh

[[ -e ${BREWPATH}/opt/kube-ps1/share/kube-ps1.sh ]] && source "${BREWPATH}/opt/kube-ps1/share/kube-ps1.sh"

PROMPT='%B%m:$(shrink_path -f)%b${vcs_info_msg_0_} %# '

function aws_profile {
  if [ -v AWS_PROFILE ]; then
    echo "[:${AWS_PROFILE}]"
  fi
}

RPROMPT='$(aws_profile)|$(kube_ps1)'
