-- [nfnl] lua/plugins/treesitter.fnl
local u = require("util")
local function enable_ts_for_lang(lang)
  local function _1_()
    return vim.treesitter.start()
  end
  return vim.api.nvim_create_autocmd("FileType", {pattern = {lang}, callback = _1_})
end
local function _2_()
  local languages = {"clojure", "css", "fennel", "hcl", "html", "javascript", "json", "latex", "markdown", "markdown_inline", "python", "regex", "scss", "svelte", "tsx", "typst", "vue"}
  require("nvim-treesitter").install(languages)
  for _, lang in ipairs(languages) do
    enable_ts_for_lang(lang)
  end
  return nil
end
return {u.tx("nvim-treesitter/nvim-treesitter", {dependencies = {"OXY2DEV/markview.nvim"}, build = ":TSUpdate", init = _2_, lazy = false})}
