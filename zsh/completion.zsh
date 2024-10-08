fpath=(${ZSH}/zsh/functions ${BREWPATH}/share/zsh/site-functions $fpath)
#
# initialize autocomplete
#
#
zmodload zsh/complist

autoload -U compinit 
compinit

zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' use-cache on

zstyle ':completion:*' menu select
zstyle ':completion:*' complete-options true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
zstyle ':completion:*:descriptions' format '-- %b%f %d --%f%k%u'



zstyle ':completion:*' group-name ''
# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending


source ${BREWPATH}/share/zsh/site-functions/aws_zsh_completer.sh

completions=($ZSH/zsh/completions/_*)
for completion in $completions
do
    source $completion
done

