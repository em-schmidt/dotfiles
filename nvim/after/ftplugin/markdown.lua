-- [nfnl] after/ftplugin/markdown.fnl
vim.api.nvim_set_option_value("spell", true, {scope = "local"})
vim.api.nvim_set_option_value("linebreak", true, {scope = "local"})
vim.keymap.set("n", "<localleader>r", "<cmd>MdEval<cr>", {buffer = true, desc = "execute code block", noremap = true})
vim.keymap.set("n", "<localleader>m", "<cmd>Markview toggle<cr>", {buffer = true, desc = "toggle markdown formatting", noremap = true})
return vim.keymap.set("n", "<localleader>c", "<cmd>ObsidianToggleCheckbox<cr>", {buffer = true, desc = "toggle checkbox", noremap = true})
