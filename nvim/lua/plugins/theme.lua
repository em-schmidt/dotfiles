-- [nfnl] Compiled from lua/plugins/theme.fnl by https://github.com/Olical/nfnl, do not edit.
local u = require("util")
local function _1_()
  do local _ = (require("github-theme")).setup end
  return vim.cmd("colorscheme github_light")
end
local function _2_()
  vim.api.nvim_set_option("background", "dark")
  return vim.cmd("colorscheme github_dark")
end
local function _3_()
  vim.api.nvim_set_option("background", "light")
  return vim.cmd("colorscheme github_light")
end
local function _4_()
  do local _ = (require("nvim-navic")).setup end
  vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  return nil
end
return {u.tx("projekt0n/github-nvim-theme", {priority = 1000, config = _1_, lazy = false}), u.tx("f-person/auto-dark-mode.nvim", {opts = {update_interval = 1000, set_dark_mode = _2_, set_light_mode = _3_}}), u.tx("SmiteshP/nvim-navic", {config = _4_}), u.tx("nvim-lualine/lualine.nvim", {dependencies = {"nvim-tree/nvim-web-devicons"}, opts = {options = {theme = "auto", component_separators = "", section_separators = ""}, sections = {lualine_a = {{"mode", {upper = true}}}, lualine_b = {{"filename", {filestatus = true, path = 1}}}, lualine_c = {{"branch"}, {"diff"}}, lualine_x = {{"diagnostics"}}, lualine_y = {{"location"}}, lualine_z = {{"filetype"}}}}})}
