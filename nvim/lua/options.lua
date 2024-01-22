-- [nfnl] Compiled from lua/options.fnl by https://github.com/Olical/nfnl, do not edit.
local u = require("util")
local function set_options()
  local globals = {loaded_netrw = 1, loaded_netwrwPlugin = 1, mapleader = " ", maplocalleader = ","}
  local options = {termguicolors = true, signcolumn = "auto:2", clipboard = "unnamedplus", conceallevel = 2, completeopt = "menu,menuone,noselect", encoding = "utf-8", expandtab = true, fillchars = "vert:\226\148\131", hlsearch = true, ignorecase = true, list = true, listchars = "tab:\226\150\182-,trail:\226\128\162,extends:\194\187,precedes:\194\171", mouse = "a", number = true, pumheight = 5, relativenumber = true, ruler = true, shiftwidth = 2, smartcase = true, spelllang = "en_us", splitbelow = true, splitright = true, tabstop = 2, wildmenu = true, wrap = false}
  for key, value in pairs(globals) do
    u.set_vim_global(key, value)
  end
  for key, value in pairs(options) do
    u.set_vim_option(key, value)
  end
  return nil
end
return {set_options = set_options}
