-- [nfnl] Compiled from lua/plugins/init.fnl by https://github.com/Olical/nfnl, do not edit.
local u = require("util")
local function _1_()
  return Snacks.picker.buffers()
end
local function _2_()
  return Snacks.picker.explorer()
end
local function _3_()
  return Snacks.picker.smart()
end
local function _4_()
  return Snacks.picker.grep()
end
local function _5_()
  return Snacks.gitbrowse()
end
local function _6_()
  return Snacks.picker.git_log()
end
local function _7_()
  return Snacks.picker.git_status()
end
local function _8_()
  return Snacks.picker.notifications()
end
local function _9_()
  return Snacks.notifier.hide()
end
local function _10_()
  return Snacks.picker.projects()
end
local function _11_()
  return Snacks.picker.todo_comments()
end
local function _12_()
  return require("project_nvim").setup({})
end
local function _13_()
  return require("nvim-paredit").setup({})
end
return {u.tx("Olical/nfnl", {ft = "fennel"}), u.tx("taybart/b64.nvim"), u.tx("folke/todo-comments.nvim", {dependencies = {"nvim-lua/plenary.nvim"}, opts = {}}), u.tx("folke/snacks.nvim", {priority = 1000, opts = {gitbrowse = {enabled = true}, input = {enabled = true}, image = {enabled = true}, notifier = {enabled = true}, picker = {enabled = true}}, keys = {u.tx("<leader>bb", _1_, {desc = "buffers"}), u.tx("<leader>fe", _2_, {desc = "explorer"}), u.tx("<leader>ff", _3_, {desc = "files"}), u.tx("<leader>f/", _4_, {desc = "grep"}), u.tx("<leader>gB", _5_, {desc = "open git in browser"}), u.tx("<leader>gl", _6_, {desc = "git log"}), u.tx("<leader>gs", _7_, {desc = "git status"}), u.tx("<leader>Nh", _8_, {desc = "notificaiton history"}), u.tx("<leader>Nd", _9_, {desc = "dismiss notifications"}), u.tx("<leader>pp", _10_, {desc = "projects"}), u.tx("<leader>pt", _11_, {desc = "TODOs"})}, lazy = false}), u.tx("folke/trouble.nvim", {opts = {auto_preview = true, mode = "document_diagnostics"}}), u.tx("akinsho/toggleterm.nvim", {opts = {}}), u.tx("ahmedkhalf/project.nvim", {config = _12_}), u.tx("windwp/nvim-autopairs", {event = "InsertEnter", opts = {}}), u.tx("nacro90/numb.nvim", {opts = {show_numbers = true, show_cursorline = true, numbers_only = true, centered_peeking = true}}), u.tx("gpanders/nvim-parinfer"), u.tx("julienvincent/nvim-paredit", {config = _13_})}
