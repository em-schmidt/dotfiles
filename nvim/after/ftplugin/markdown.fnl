(vim.api.nvim_set_option_value :spell true {:scope :local})
(vim.keymap.set :n :<localleader>r "<cmd>MdEval<cr>" {:buffer true :desc "execute code block" :noremap true}) 
