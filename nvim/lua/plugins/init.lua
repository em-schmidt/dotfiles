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
  return Snacks.picker.git_log()
end
local function _5_()
  return Snacks.picker.git_status()
end
local function _6_()
  return Snacks.picker.smart()
end
local function _7_()
  return Snacks.picker.grep()
end
local function _8_()
  return Snacks.picker.projects()
end
local function _9_()
  return Snacks.picker.buffers()
end
local function _10_()
  return require("project_nvim").setup({})
end
local function _11_()
  return require("nvim-paredit").setup({})
end
return {u.tx("Olical/nfnl", {ft = "fennel"}), u.tx("rcarriga/nvim-notify", {config = _1_}), u.tx("stevearc/dressing.nvim", {event = "VeryLazy"}), u.tx("taybart/b64.nvim"), u.tx("terrortylor/nvim-comment", {config = _2_}), u.tx("folke/todo-comments.nvim", {dependencies = {"nvim-lua/plenary.nvim"}, opts = {}}), u.tx("folke/snacks.nvim", {priority = 1000, opts = {gitbrowse = {enabled = true}, image = {enabled = true}, picker = {enabled = true}}, keys = {u.tx("<leader>gB", _3_, {desc = "open git in browser"}), u.tx("<leader>gl", _4_, {desc = "git log"}), u.tx("<leader>gs", _5_, {desc = "git status"}), u.tx("<leader>ff", _6_, {desc = "files"}), u.tx("<leader>f/", _7_, {desc = "grep"}), u.tx("<leader>pp", _8_, {desc = "projects"}), u.tx("<leader>bb", _9_, {desc = "buffers"})}, lazy = false}), u.tx("akinsho/toggleterm.nvim", {opts = {}}), u.tx("ahmedkhalf/project.nvim", {config = _10_}), u.tx("windwp/nvim-autopairs", {event = "InsertEnter", opts = {}}), u.tx("nacro90/numb.nvim", {opts = {show_numbers = true, show_cursorline = true, numbers_only = true, centered_peeking = true}}), u.tx("folke/trouble.nvim", {opts = {auto_preview = true, mode = "document_diagnostics"}}), u.tx("gpanders/nvim-parinfer"), u.tx("julienvincent/nvim-paredit", {config = _11_})}
