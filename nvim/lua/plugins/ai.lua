-- [nfnl] lua/plugins/ai.fnl
local u = require("util")
local function setup_anthropic_adapter()
  return require("codecompanion.adapters").extend("anthropic", {env = {api_key = "cmd:op read --account my.1password.com op://AI/Anthropic/credential --no-newline"}})
end
local function _1_()
  local diff = require("mini.diff")
  return diff.setup({source = diff.gen_source.none()})
end
return {u.tx("zbirenbaum/copilot.lua", {lazy = true, cmd = "Copilot", event = "InsertEnter", opts = {}, keys = {u.nlkm("ap", "Copilot panel", "panel")}}), u.tx("olimorris/codecompanion.nvim", {dependencies = {"nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter"}, opts = {adapters = {anthropic = setup_anthropic_adapter}, strategies = {chat = {adapter = "copilot"}}, opts = {log_level = "DEBUG"}, display = {diff = {enabled = true, provider = "mini_diff"}}}, keys = {u.nlkm("ac", "CodeCompanionChat Toggle", "chat"), u.nlkm("aa", "CodeCompanionActions", "chat")}}), u.tx("echasnovski/mini.diff", {config = _1_})}
