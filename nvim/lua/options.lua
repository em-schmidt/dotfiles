-- [nfnl] lua/options.fnl
local u = require("util")
local function set_options()
  local globals = {loaded_node_provider = 0, loaded_perl_provider = 0, loaded_python3_provider = 0, loaded_ruby_provider = 0, mapleader = " ", maplocalleader = ","}
  local options = {termguicolors = true, signcolumn = "auto:2", conceallevel = 2, completeopt = "menu,menuone,noselect", encoding = "utf-8", expandtab = true, foldexpr = "nvim_treesitter#foldexpr()", foldmethod = "expr", foldlevel = 9, fillchars = "vert:\226\148\131,diff:\226\149\177", guifont = "JetBrainsMono Nerd Font:h18", hlsearch = true, ignorecase = true, list = true, listchars = "tab:\226\150\182-,trail:\226\128\162,extends:\194\187,precedes:\194\171", mouse = "a", number = true, pumheight = 5, relativenumber = true, ruler = true, shiftwidth = 2, smartcase = true, spelllang = "en_us", splitbelow = true, splitright = true, tabstop = 2, wildmenu = true, wrap = false}
  for key, value in pairs(globals) do
    u.set_vim_global(key, value)
  end
  for key, value in pairs(options) do
    u.set_vim_option(key, value)
  end
  return vim.filetype.add({extension = {tf = "terraform"}})
end
return {set_options = set_options}
