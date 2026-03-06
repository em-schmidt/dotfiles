-- [nfnl] lua/plugins/markdown.fnl
local u = require("util")
local function note_id_func(title)
  local suffix = ""
  if (title ~= nil) then
    suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
  else
    for _ = 1, 4 do
      suffix = (suffix .. string.char(math.random(65, 90)))
    end
  end
  return (tostring(os.date("%Y.%m.%d")) .. "-" .. suffix)
end
local function _2_()
  local presets = require("markview.presets")
  return require("markview").setup({markdown = {code_blocks = {style = "simple"}, headings = presets.headings.glow, horizontal_rules = presets.horizontal_rules.thick, tables = presets.tables.rounded}, experimental = {check_rtp_message = false}, preview = {filetypes = {"markdown", "codecompanion"}, ignore_buftypes = {}}})
end
local function _3_()
  return require("markdown-table-mode").setup()
end
local function _4_()
  return os.date("%B %d, %Y")
end
return {u.tx("OXY2DEV/markview.nvim", {dependencies = {"nvim-tree/nvim-web-devicons", "echasnovski/mini.icons"}, config = _2_, lazy = false}), u.tx("jubnzv/mdeval.nvim"), u.tx("Kicamon/markdown-table-mode.nvim", {config = _3_, keys = {u.nlkm("mT", "Mtm", "toggle markdown table mode")}}), u.tx("obsidian-nvim/obsidian.nvim", {version = "*", lazy = true, ft = "markdown", dependencies = {"nvim-lua/plenary.nvim", "OXY2DEV/markview.nvim"}, opts = {workspaces = {{name = "notes", path = "~/workspace/spaceba.by/notes"}}, ui = {enable = false}, attachments = {folder = "assets/images"}, daily_notes = {folder = "daily", date_format = "%Y/%m/%Y.%m.%d", template = "daily.md"}, search = {sort_by = "modified", sort_reversed = true}, templates = {folder = ".obsidian/templates", date_format = "%YYYY-%MM-%DD", time_format = "%H:%mm", substitutions = {human_today = _4_}}, hl_groups = {ObsidianTodo = {bold = true, fg = "#f78c6c"}}, note_id_func = note_id_func, legacy_commands = false}, keys = {u.nlkm("nb", "Obsidian backlinks", "incoming links"), u.nlkm("nt", "Obsidian today", "today's note"), u.nlkm("nl", "Obsidian links", "incoming links"), u.nlkm("nN", "Obsidian template", "new note from template"), u.nlkm("nn", "Obsidian dailies -10", "note picker"), u.nlkm("np", "Obsidian paste_img", "paste image"), u.nlkm("nr", "Obsidian rename", "rename current note"), u.vlkm("ne", "Obsidian extract_note", "extract note")}})}
