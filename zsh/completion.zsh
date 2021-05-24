fpath=(/usr/local/share/zsh/site-functions $fpath)
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

source /opt/homebrew/share/zsh/site-functions/aws_zsh_completer.sh

complete -o nospace -C /usr/local/bin/vault vault
