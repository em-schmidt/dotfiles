-- [nfnl] lua/plugins/ai.fnl
local u = require("util")
local function setup_anthropic_adapter()
  return require("codecompanion.adapters").extend("anthropic", {env = {api_key = "cmd:op read --account my.1password.com op://AI/Anthropic/credential --no-newline"}})
end
local function setup_openai_adapter()
  return require("codecompanion.adapters").extend("openai", {env = {api_key = "cmd:op read --account my.1password.com op://AI/OpenAI/credential --no-newline"}})
end
local function _1_()
  return require("mcphub").setup({use_bundled_binary = true})
end
local function _2_()
  local diff = require("mini.diff")
  return diff.setup({source = diff.gen_source.none()})
end
return {u.tx("zbirenbaum/copilot.lua", {lazy = true, cmd = "Copilot", event = "InsertEnter", opts = {}}), u.tx("olimorris/codecompanion.nvim", {dependencies = {"nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter"}, opts = {adapters = {anthropic = setup_anthropic_adapter, openai = setup_openai_adapter}, extensions = {mcphub = {callback = "mcphub.extensions.codecompanion", opts = {make_vars = true, make_slash_commands = true, show_results_in_chat = true}}}, strategies = {chat = {adapter = "anthropic", model = "claude-opus-4-20250514"}, inline = {adapter = "anthropic", model = "claude-opus-4-20250514"}}, opts = {log_level = "DEBUG"}, display = {diff = {enabled = true, provider = "mini_diff"}}}, keys = {u.nlkm("ac", "CodeCompanionChat Toggle", "chat"), u.vlkm("ac", "CodeCompanionChat Toggle", "chat"), u.nlkm("aa", "CodeCompanionActions", "chat"), u.vlkm("aa", "CodeCompanionActions", "chat")}}), u.tx("ravitemer/mcphub.nvim", {dependencies = {"nvim-lua/plenary.nvim"}, build = "bundled_build.lua", config = _1_}), u.tx("echasnovski/mini.diff", {config = _2_}), u.tx("NickvanDyke/opencode.nvim", {dependencies = {"folke/snacks.nvim"}, keys = {u.nlkm("ot", "lua require('opencode').toggle()", "toggle embeded opencode"), u.nlkm("oa", "lua require('opencode').ask()", "ask opencode"), u.vlkm("oa", "lua require('opencode').ask('@selection: ')", "ask opencode about selection"), u.nlkm("op", "lua require('opencode').select_prompt()", "select prompt"), u.vlkm("op", "lua require('opencode').select_prompt()", "select prompt"), u.nlkm("on", "lua require('opencode').command('session_new')", "new session"), u.nlkm("os", "lua require('opencode').command('switch_mode')", "switch mode"), u.nlkm("oy", "lua require('opencode').command('messages_copy')", "copy messages")}})}
