-- [nfnl] lua/plugins/theme.fnl
local u = require("util")
local function _1_()
  do local _ = require("github-theme").setup end
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
  do local _ = require("nvim-navic").setup end
  vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  return nil
end
return {u.tx("projekt0n/github-nvim-theme", {priority = 1000, config = _1_, lazy = false}), u.tx("f-person/auto-dark-mode.nvim", {opts = {update_interval = 1000, set_dark_mode = _2_, set_light_mode = _3_}}), u.tx("SmiteshP/nvim-navic", {config = _4_}), u.tx("nvim-lualine/lualine.nvim", {dependencies = {"nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine", "franco-ruggeri/codecompanion-lualine.nvim"}, opts = {extensions = {"nvim-tree", "toggleterm", "trouble", "fugitive", "lazy", "overseer", "snacks"}, options = {theme = "auto", component_separators = "|", section_separators = {left = "\238\130\180", right = "\238\130\182"}, always_show_tabline = false}, sections = {lualine_a = {u.tx("mode", {separator = {left = "\238\130\182"}, right_padding = 1})}, lualine_b = {{"filename", {filestatus = true, path = 1}}}, lualine_c = {{"branch"}, {"diff"}}, lualine_x = {{"diagnostics"}, {"overseer"}, {"codecompanion"}}, lualine_y = {{"filetype"}, {"progress"}}, lualine_z = {u.tx("location", {separator = {right = "\238\130\180"}, left_padding = 1})}}, tabline = {lualine_z = {u.tx("tabs", {mode = 2})}}}})}
