-- [nfnl] Compiled from lua/mappings.fnl by https://github.com/Olical/nfnl, do not edit.
local function create_keymaps()
  vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", {noremap = true})
  return vim.keymap.set("t", "<esc><leader>.", "<cmd>ToggleTerm<cr>", {noremap = true})
end
return {create_keymaps = create_keymaps}
