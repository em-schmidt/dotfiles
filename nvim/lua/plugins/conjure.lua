-- [nfnl] Compiled from lua/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local u = require("util")
local function _1_()
  vim.g["conjure#eval#result_register"] = "*"
  vim.g["conjure#log#botright"] = true
  vim.g["conjure#log#wrap"] = true
  vim.g["conjure#log#fold#enabled"] = true
  vim.g["conjure#mapping#doc_word"] = "gk"
  vim.g["conjure#highlight#enabled"] = true
  vim.g["conjure#highlight#group"] = "IncSearch"
  vim.g["conjure#highlight#timeout"] = 500
  vim.g["conjure#log#hud#width"] = 1
  vim.g["conjure#log#hud#enabled"] = true
  vim.g["conjure#log#hud#anchor"] = "SE"
  vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = true
  vim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true
  vim.g["conjure#client#clojure#nrepl#test#runner"] = "kaocha"
  vim.g["conjure#client#clojure#nrepl#test#raw_out"] = true
  return nil
end
return {u.tx("olical/conjure", {ft = {"clojure", "fennel", "python"}, init = _1_})}
