-- [nfnl] Compiled from lua/mappings.fnl by https://github.com/Olical/nfnl, do not edit.
local function create_keymaps()
  return vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", {noremap = true})
end
return {create_keymaps = create_keymaps}
