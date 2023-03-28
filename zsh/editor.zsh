export EDITOR='nvim'

function vi() {
  if [ -n "${NVIM}" ]; then
    if [ -x "$(command -v nvr)" ]; then
      nvr --remote-tab $*
    fi
  else
    $EDITOR $*
  fi
}
