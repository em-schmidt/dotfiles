-- [nfnl] lua/plugins/init.fnl
local u = require("util")
local function _1_()
  return Snacks.picker.buffers()
end
local function _2_()
  return Snacks.picker.explorer()
end
local function _3_()
  return Snacks.picker.files()
end
local function _4_()
  return Snacks.picker.smart()
end
local function _5_()
  return Snacks.picker.explorer()
end
local function _6_()
  return Snacks.picker.grep()
end
local function _7_()
  return Snacks.gitbrowse()
end
local function _8_()
  return Snacks.picker.git_log()
end
local function _9_()
  return Snacks.picker.git_status()
end
local function _10_()
  return Snacks.picker.notifications()
end
local function _11_()
  return Snacks.notifier.hide()
end
local function _12_()
  return Snacks.picker.projects()
end
local function _13_()
  return Snacks.picker.todo_comments()
end
local function _14_()
  return require("project_nvim").setup({})
end
return {u.tx("Olical/nfnl", {ft = "fennel"}), u.tx("taybart/b64.nvim"), u.tx("folke/todo-comments.nvim", {dependencies = {"nvim-lua/plenary.nvim"}, opts = {}}), u.tx("folke/snacks.nvim", {priority = 1000, opts = {dashboard = {sections = {{icon = "\239\132\156 ", title = "Keymaps", section = "keys", indent = 2, padding = 1}, {icon = "\239\133\155 ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1}, {icon = "\239\129\188 ", title = "Projects", section = "projects", indent = 2, padding = 1}, {section = "startup"}}}, explorer = {}, image = {enabled = true}, input = {enabled = true}, notifier = {enabled = true}, picker = {enabled = true}, statuscolumn = {}, terminal = {enabled = true}, gitbrowse = {enabled = true}}, keys = {u.tx("<leader>bb", _1_, {desc = "buffers"}), u.tx("<leader>fe", _2_, {desc = "explorer"}), u.tx("<leader>ff", _3_, {desc = "files"}), u.tx("<leader>fs", _4_, {desc = "explorer"}), u.tx("<leader>ft", _5_, {desc = "explorer"}), u.tx("<leader>f/", _6_, {desc = "grep"}), u.tx("<leader>gB", _7_, {desc = "open git in browser"}), u.tx("<leader>gl", _8_, {desc = "git log"}), u.tx("<leader>gs", _9_, {desc = "git status"}), u.tx("<leader>Nh", _10_, {desc = "notificaiton history"}), u.tx("<leader>Nd", _11_, {desc = "dismiss notifications"}), u.tx("<leader>pp", _12_, {desc = "projects"}), u.tx("<leader>pt", _13_, {desc = "TODOs"})}, lazy = false}), u.tx("folke/trouble.nvim", {opts = {}}), u.tx("akinsho/toggleterm.nvim", {opts = {}}), {dir = "~/workspace/longway.nvim", dependencies = {"nvim-lua/plenary.nvim"}, opts = {token_file = vim.fn.expand("~/.config/longway.nvim/token"), workspace_dir = vim.fn.expand("~/workspace/spaceba.by/notes/work/crossbeam/shortcut"), auto_push_on_save = true, pull_on_open = true, conflict_strategy = "prompt", presets = {my_work = {query = "owner:eschmidt", description = "my stories"}}, default_preset = "my_work", debug = false}, keys = {u.tx("<leader>pc", "<cmd>LongwayPicker comments<cr>", {desc = "shortcut comments"}), u.tx("<leader>pe", "<cmd>LongwayPicker epics<cr>", {desc = "shortcut epics"}), u.tx("<leader>pm", "<cmd>LongwayPicker modified<cr>", {desc = "shortcut modified"}), u.tx("<leader>pP", "<cmd>LongwayPicker presets<cr>", {desc = "shortcut presets"}), u.tx("<leader>pS", "<cmd>LongwayStatus<cr>", {desc = "shortcut Status"}), u.tx("<leader>ps", "<cmd>LongwayPicker stories<cr>", {desc = "shortcut stories"})}}, u.tx("ahmedkhalf/project.nvim", {config = _14_}), u.tx("windwp/nvim-autopairs", {event = "InsertEnter", opts = {}}), u.tx("nacro90/numb.nvim", {opts = {show_numbers = true, show_cursorline = true, numbers_only = true, centered_peeking = true}}), u.tx("gpanders/nvim-parinfer"), u.tx("julienvincent/nvim-paredit", {opts = {}})}
