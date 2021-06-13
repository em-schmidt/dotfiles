[[ -e /opt/homebrew/bin ]] && BREWPATH=/opt/homebrew
[[ -e /usr/local/bin/brew ]] && BREWPATH=/usr/local

eval "$(${BREWPATH}/bin/brew shellenv)"
