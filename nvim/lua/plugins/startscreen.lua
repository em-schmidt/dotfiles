-- [nfnl] Compiled from lua/plugins/startscreen.fnl by https://github.com/Olical/nfnl, do not edit.
local u = require("util")
local function _1_()
  local dashboard = require("alpha.themes.dashboard")
  local buttons = {type = "group", val = {{type = "text", val = "Quick Actions", opts = {hl = "Bold", position = "center"}}, {type = "padding", val = 1}, dashboard.button("e", "\239\133\155  New file", "<cmd>ene<cr>"), dashboard.button("SPC f f", "\243\176\136\158  Find file"), dashboard.button("SPC f /", "\243\176\138\132  Live grep"), dashboard.button("c", "\238\152\149  Configuration", "<cmd>cd ~/.config/nvim/ <cr>"), dashboard.button("u", "\239\132\185  Update plugins", "<cmd>Lazy sync<cr>"), dashboard.button("q", "\243\176\133\154  Quit", "<cmd>qa<cr>")}, position = "center"}
  local config
  local function _2_()
    local function _3_()
      do local _ = (require("alpha")).redraw end
      return vim.cmd("AlphaRemap")
    end
    return vim.api.nvim_create_autocmd("DirChanged", {pattern = "*", callback = _3_})
  end
  config = {layout = {buttons}, opts = {margin = 5, setup = _2_}}
  return (require("alpha")).setup(config)
end
return {u.tx("goolord/alpha-nvim", {dependencies = {"nvim-tree/nvim-web-devicons"}, config = _1_})}
