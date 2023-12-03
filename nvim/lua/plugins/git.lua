-- [nfnl] Compiled from lua/plugins/git.fnl by https://github.com/Olical/nfnl, do not edit.
local u = require("util")
return {u.tx("tpope/vim-fugitive"), u.tx("sindrets/diffview.nvim", {opts = {}}), u.tx("lewis6991/gitsigns.nvim", {opts = {}})}
