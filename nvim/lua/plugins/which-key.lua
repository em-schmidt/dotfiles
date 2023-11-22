-- [nfnl] Compiled from lua/plugins/which-key.fnl by https://github.com/Olical/nfnl, do not edit.
local u = require("util")
local function _1_()
  vim.o.timeout = true
  vim.o.timeoutlen = 300
  return nil
end
return {u.tx("folke/which-key.nvim", {event = "VeryLazy", init = _1_, opts = {}})}
