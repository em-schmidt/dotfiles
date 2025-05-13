-- [nfnl] lua/plugins/conjure.fnl
local u = require("util")
local function _1_()
  do
    local eval = require("conjure.eval")
    local init_portal
    local function _2_()
      return eval["eval-str"]({origin = "portal-wrapper", code = "(require '[portal.api :as p]) (def p (p/open)) (add-tap #'p/submit)"})
    end
    init_portal = _2_
    local on_filetype
    local function _3_()
      return vim.api.nvim_buf_set_keymap(0, "n", "<localleader>pi", "", {desc = "initialize portal", callback = init_portal})
    end
    on_filetype = _3_
    local augroup = vim.api.nvim_create_augroup("portal", {})
    vim.api.nvim_create_autocmd("FileType", {group = augroup, pattern = {"clojure"}, callback = on_filetype})
  end
  local function _4_()
    return vim.diagnostic.disable(0)
  end
  vim.api.nvim_create_autocmd("BufNewFile", {group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", {clear = true}), pattern = {"conjure-log-*"}, callback = _4_, desc = "Conjure Log disable LSP diagnostics"})
  vim.g["conjure#eval#result_register"] = "*"
  vim.g["conjure#log#botright"] = true
  vim.g["conjure#log#wrap"] = true
  vim.g["conjure#log#fold#enabled"] = true
  vim.g["conjure#mapping#doc_word"] = "gk"
  vim.g["conjure#highlight#enabled"] = true
  vim.g["conjure#highlight#group"] = "IncSearch"
  vim.g["conjure#highlight#timeout"] = 500
  vim.g["conjure#log#hud#width"] = 0.6
  vim.g["conjure#log#hud#enabled"] = true
  vim.g["conjure#log#hud#anchor"] = "NE"
  vim.g["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = "bb -Sdeps '{:deps {djblue/portal {:mvn/version \"0.57.3\"}}}' nrepl-server localhost:$port"
  vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = true
  vim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true
  vim.g["conjure#client#clojure#nrepl#test#runner"] = "kaocha"
  vim.g["conjure#client#clojure#nrepl#test#raw_out"] = true
  return nil
end
return {u.tx("olical/conjure", {ft = {"clojure", "fennel", "python"}, init = _1_})}
