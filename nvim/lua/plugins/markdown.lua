-- [nfnl] lua/plugins/markdown.fnl
local u = require("util")
local function _1_()
  local presets = require("markview.presets")
  return require("markview").setup({markdown = {code_blocks = {style = "simple"}, headings = presets.headings.glow, horizontal_rules = presets.horizontal_rules.thick, tables = presets.tables.rounded}, experimental = {check_rtp_message = false}, preview = {filetypes = {"markdown", "codecompanion"}, ignore_buftypes = {}}})
end
local function _2_()
  return require("markdown-table-mode").setup()
end
return {u.tx("OXY2DEV/markview.nvim", {dependencies = {"nvim-tree/nvim-web-devicons", "echasnovski/mini.icons"}, config = _1_, lazy = false}), u.tx("jubnzv/mdeval.nvim"), u.tx("Kicamon/markdown-table-mode.nvim", {config = _2_}), u.tx("obsidian-nvim/obsidian.nvim", {version = "*", lazy = true, ft = "markdown", dependencies = {"nvim-lua/plenary.nvim", "OXY2DEV/markview.nvim"}, opts = {workspaces = {{name = "notes", path = "~/workspace/spaceba.by/notes"}}, ui = {enable = false}, attachments = {folder = "assets/images"}, daily_notes = {folder = "daily", date_format = "%Y/%m/%Y.%m.%d", template = nil}, search = {sort_by = "modified", sort_reversed = true}, open_notes_in = "vsplit", hl_groups = {ObsidianTodo = {bold = true, fg = "#f78c6c"}}, legacy_commands = false}, keys = {u.nlkm("nt", "Obsidian today", "today's note"), u.nlkm("nn", "Obsidian dailies -10", "note picker")}})}
