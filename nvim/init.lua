-- [nfnl] Compiled from init.fnl by https://github.com/Olical/nfnl, do not edit.
local packpath = (vim.fn.stdpath("data") .. "/lazy")
local lazypath = (packpath .. "/lazy.nvim")
local mappings = require("mappings")
local options = require("options")
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
else
end
do end (vim.opt.rtp):prepend(lazypath)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = ","
options.set_options()
mappings.create_keymaps()
local lazy = require("lazy")
return lazy.setup("plugins")
