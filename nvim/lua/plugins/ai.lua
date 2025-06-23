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
return {u.tx("zbirenbaum/copilot.lua", {lazy = true, cmd = "Copilot", event = "InsertEnter", opts = {}}), u.tx("olimorris/codecompanion.nvim", {dependencies = {"nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter"}, opts = {adapters = {anthropic = setup_anthropic_adapter, openai = setup_openai_adapter}, extensions = {mcphub = {callback = "mcphub.extensions.codecompanion", opts = {make_vars = true, make_slash_commands = true, show_results_in_chat = true}}}, strategies = {chat = {adapter = "copilot"}}, opts = {log_level = "DEBUG"}, display = {diff = {enabled = true, provider = "mini_diff"}}}, keys = {u.nlkm("ac", "CodeCompanionChat Toggle", "chat"), u.nlkm("aa", "CodeCompanionActions", "chat")}}), u.tx("ravitemer/mcphub.nvim", {dependencies = {"nvim-lua/plenary.nvim"}, build = "bundled_build.lua", config = _1_}), u.tx("echasnovski/mini.diff", {config = _2_})}
