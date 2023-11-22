-- [nfnl] Compiled from init.fnl by https://github.com/Olical/nfnl, do not edit.
local packpath = (vim.fn.stdpath("data") .. "/lazy")
local lazypath = (packpath .. "/lazy.nvim")
local mappings = require("mappings")
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
else
end
do end (vim.opt.rtp):prepend(lazypath)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.encoding = "utf-8"
vim.o.expandtab = true
vim.o.fillchars = "vert:\226\148\131"
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.list = true
vim.o.wrap = false
vim.o.listchars = "tab:\226\150\182-,trail:\226\128\162,extends:\194\187,precedes:\194\171"
vim.o.mouse = "a"
vim.o.number = true
vim.o.pumheight = 5
vim.o.relativenumber = true
vim.o.ruler = true
vim.o.shiftwidth = 2
vim.o.signcolumn = "auto:2"
vim.o.smartcase = true
vim.o.spelllang = "en_us"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.wildmenu = true
mappings.create_keymaps()
local lazy = require("lazy")
return lazy.setup("plugins")
