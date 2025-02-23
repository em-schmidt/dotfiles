-- [nfnl] Compiled from init.fnl by https://github.com/Olical/nfnl, do not edit.
local packpath = (vim.fn.stdpath("data") .. "/lazy")
local lazypath = (packpath .. "/lazy.nvim")
local mappings = require("mappings")
local options = require("options")
local commands = require("commands")
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
else
end
vim.opt.rtp:prepend(lazypath)
options.set_options()
commands.register_commands()
local lazy = require("lazy")
lazy.setup("plugins")
return mappings.create_keymaps()
