-- [nfnl] Compiled from lua/plugins/nvim-tree.fnl by https://github.com/Olical/nfnl, do not edit.
local u = require("util")
local function _1_()
  return (require("nvim-tree")).setup({sort = {sorter = "case_sensitive"}, view = {adaptive_size = true}, renderer = {group_empty = true}, filters = {dotfiles = true, custom = {".lua$"}}})
end
return {u.tx("nvim-tree/nvim-tree.lua", {version = "*", dependencies = {"nvim-tree/nvim-web-devicons"}, config = _1_, lazy = false})}
