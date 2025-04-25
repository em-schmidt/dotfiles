-- [nfnl] lua/plugins/ai.fnl
local u = require("util")
return {u.tx("zbirenbaum/copilot.lua", {lazy = true, cmd = "Copilot", event = "InsertEnter", opts = {}, keys = {u.nlkm("ap", "Copilot panel", "panel")}})}
