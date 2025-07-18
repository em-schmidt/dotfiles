-- [nfnl] lua/mappings.fnl
local function create_keymaps()
  vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", {noremap = true})
  vim.keymap.set("t", "<esc><leader>.", "<cmd>ToggleTerm<cr>", {noremap = true})
  return vim.keymap.set("ca", "cc", "CodeCompanion")
end
return {create_keymaps = create_keymaps}
