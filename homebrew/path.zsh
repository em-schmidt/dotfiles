[[ -e /opt/homebrew/bin ]] && BREWPATH=/opt/homebrew/bin
[[ -e /usr/local/bin/brew ]] && BREWPATH=/usr/local/bin

eval "$(${BREWPATH}/brew shellenv)"
