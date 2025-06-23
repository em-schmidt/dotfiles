-- [nfnl] lua/plugins/overseer.fnl
local u = require("util")
return u.tx("stevearc/overseer.nvim", {opts = {templates = {"builtin", "clojure", "terraform"}}})
