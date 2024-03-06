
(fn create_keymaps
  []
  "apply the keymaps"

  ;;terminal mode double esscape to get to normal mode
  (vim.keymap.set :t :<esc><esc> "<c-\\><c-n>" {:noremap true}))


{: create_keymaps}
