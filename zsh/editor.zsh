export EDITOR='nvim'

function vi() {
  if [ -n "${NVIM}" ]; then
    $EDITOR --server ${NVIM} --remote-tab $*
  else
    $EDITOR $*
  fi
}
