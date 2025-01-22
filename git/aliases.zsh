# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'
alias gdt='git difftool'

alias gc='git commit'
alias gca='git commit -a'
alias gs='git status -sb'
alias gsb='git switch'
alias gsm='git switch main'
alias gfp='git fetch && git pull'
