-- [nfnl] Compiled from lua/plugins/obsidian.fnl by https://github.com/Olical/nfnl, do not edit.
local u = require("util")
local function _1_()
  return (require("render-markdown")).setup()
end
local function _2_(url)
  return vim.fn.jobstart({"open", url})
end
return {u.tx("MeanderingProgrammer/markdown.nvim", {config = _1_}), u.tx("epwalsh/obsidian.nvim", {version = "*", ft = "markdown", dependencies = {"nvim-lua/plenary.nvim"}, opts = {workspaces = {{name = "notes", path = "~/workspace/spaceba.by/notes"}}, attachments = {img_folder = "assets/images"}, daily_notes = {folder = "daily", date_format = "%Y.%m.%d", template = nil}, sort_by = "modified", sort_reversed = true, open_notes_in = "vsplit", external_link_icon = {char = "\239\130\142", hl_group = "ObsidianExtLinkIcon"}, follow_url_func = _2_, hl_groups = {ObsidianTodo = {bold = true, fg = "#f78c6c"}}}, lazy = false})}
