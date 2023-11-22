(local u (require :util))

[(u.tx
   :folke/which-key.nvim
   {:event :VeryLazy
    :init (fn [] (set vim.o.timeout true)
           (set vim.o.timeoutlen 300))
    :opts {}})]
   
