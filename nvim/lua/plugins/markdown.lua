-- [nfnl] Compiled from lua/plugins/markdown.fnl by https://github.com/Olical/nfnl, do not edit.
local u = require("util")
local function _1_()
  local presets = require("markview.presets")
  return require("markview").setup({markdown = {code_blocks = {style = "simple"}, headings = presets.headings.glow, horizontal_rules = presets.horizontal_rules.thick, tables = presets.tables.rounded}})
end
local function _2_()
  return require("markdown-table-mode").setup()
end
local function _3_(url)
  return vim.fn.jobstart({"open", url})
end
return {u.tx("OXY2DEV/markview.nvim", {dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons", "echasnovski/mini.icons"}, config = _1_, lazy = false}), u.tx("jubnzv/mdeval.nvim"), u.tx("Kicamon/markdown-table-mode.nvim", {config = _2_}), u.tx("epwalsh/obsidian.nvim", {version = "*", ft = "markdown", dependencies = {"nvim-lua/plenary.nvim"}, opts = {workspaces = {{name = "notes", path = "~/workspace/spaceba.by/notes"}}, ui = {enable = false}, attachments = {img_folder = "assets/images"}, daily_notes = {folder = "daily", date_format = "%Y/%m/%Y.%m.%d", template = nil}, sort_by = "modified", sort_reversed = true, open_notes_in = "vsplit", follow_url_func = _3_, hl_groups = {ObsidianTodo = {bold = true, fg = "#f78c6c"}}}, lazy = false})}
