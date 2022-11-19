fpath=(${BREWPATH}/share/zsh/site-functions $fpath)
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

zstyle ':completion:*:default' list-colors '=(#b)*(XX *)=32=31' '=*=32'

source ${BREWPATH}/share/zsh/site-functions/aws_zsh_completer.sh

