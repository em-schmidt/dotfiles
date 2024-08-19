-- [nfnl] Compiled from after/ftplugin/markdown.fnl by https://github.com/Olical/nfnl, do not edit.
vim.api.nvim_set_option_value("spell", true, {scope = "local"})
return vim.keymap.set("n", "<localleader>r", "<cmd>MdEval<cr>", {buffer = true, desc = "execute code block", noremap = true})
