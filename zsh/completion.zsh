fpath=(${ZSH}/zsh/functions ${BREWPATH}/share/zsh/site-functions $fpath)
#
# initialize autocomplete
#
#
zmodload zsh/complist

zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' use-cache on

zstyle ':completion:*' menu select
zstyle ':completion:*' complete-options true
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
zstyle ':completion:*:descriptions' format '-- %b%f %d --%f%k%u'

LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:no=1;32"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


zstyle ':completion:*' group-name ''
# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

autoload -U compinit 
compinit

source ${BREWPATH}/share/zsh/site-functions/aws_zsh_completer.sh

completions=($ZSH/zsh/functions/_*)
for completion in $completions
do
    source $completion
done

completions=($ZSH/zsh/completions/_*)
for completion in $completions
do
    source $completion
done

