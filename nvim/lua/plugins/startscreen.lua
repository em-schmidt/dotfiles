-- [nfnl] Compiled from lua/plugins/startscreen.fnl by https://github.com/Olical/nfnl, do not edit.
local u = require("util")
local function _1_()
  local config = (require("alpha.themes.startify")).config
  return (require("alpha")).setup(config)
end
return {u.tx("goolord/alpha-nvim", {dependencies = {"nvim-tree/nvim-web-devicons"}, config = _1_, opts = {}})}
