-- [nfnl] Compiled from lua/plugins/init.fnl by https://github.com/Olical/nfnl, do not edit.
local u = require("util")
local function _1_()
  local notify = require("notify")
  vim.notify = notify
  return nil
end
local function _2_()
  return require("nvim_comment").setup({})
end
local function _3_()
  return Snacks.gitbrowse()
end
local function _4_()
  return require("project_nvim").setup({})
end
local function _5_()
  return require("nvim-paredit").setup({})
end
return {u.tx("Olical/nfnl", {ft = "fennel"}), u.tx("rcarriga/nvim-notify", {config = _1_}), u.tx("stevearc/dressing.nvim", {event = "VeryLazy"}), u.tx("taybart/b64.nvim"), u.tx("terrortylor/nvim-comment", {config = _2_}), u.tx("folke/todo-comments.nvim", {dependencies = {"nvim-lua/plenary.nvim"}, opts = {}}), u.tx("folke/snacks.nvim", {priority = 1000, opts = {gitbrowse = {enabled = true}, image = {enabled = true}}, keys = {u.tx("<leader>gB", _3_, {desc = "open git in browser"})}, lazy = false}), u.tx("akinsho/toggleterm.nvim", {opts = {}}), u.tx("ahmedkhalf/project.nvim", {config = _4_}), u.tx("windwp/nvim-autopairs", {event = "InsertEnter", opts = {}}), u.tx("nacro90/numb.nvim", {opts = {show_numbers = true, show_cursorline = true, numbers_only = true, centered_peeking = true}}), u.tx("folke/trouble.nvim", {opts = {auto_preview = true, mode = "document_diagnostics"}}), u.tx("gpanders/nvim-parinfer"), u.tx("julienvincent/nvim-paredit", {config = _5_})}
