-- [nfnl] lua/plugins/treesitter.fnl
local u = require("util")
local function _1_()
  return require("nvim-treesitter.install").update({with_sync = true})()
end
local function _2_()
  local configs = require("nvim-treesitter.configs")
  return configs.setup({ensure_installed = {"clojure", "css", "fennel", "hcl", "html", "json", "latex", "markdown", "markdown_inline", "norg", "python", "regex", "scss", "svelte", "tsx", "typst", "vue"}, sync_install = true, auto_install = true, indent = {enable = true}, highlight = {enable = true, additional_vim_regex_highlighting = false}, textobjects = {enable = true}})
end
return {u.tx("nvim-treesitter/nvim-treesitter", {dependencies = {"OXY2DEV/markview.nvim"}, build = _1_, config = _2_})}
