(local u (require :util))

[(u.tx
   :folke/which-key.nvim
   {:event :VeryLazy
    :init (fn []
            (let [wk (require "which-key")]

              (wk.register {:b {:name "buffers"}
                            :prefix "<leader>"})

              (wk.register {:e {:name "errors"}
                            :prefix "<leader>"})

              (wk.register {:f {:name "files"}
                            :prefix "<leader>"})

              (wk.register {:g {:name "git"}
                            :prefix "<leader>"})

              (wk.register {:l {:name "lsp"}
                            :prefix "<leader>"})

              (wk.register {:p {:name "projects"}
                            :prefix "<leader>"})

              (wk.register {:P {:name "plugins"}
                            :prefix "<leader>"})

              (wk.register {:t {:name "tabs"
                                :t {"<cmd>Telescope tele_tabby list<cr>" "list tabs"} 
                                :d {"<cmd>tabclose<cr>" "close current tab"}
                                :n {"<cmd>tabnext<cr>" "next tab"}
                                :N {"<cmd>tabnew<cr>" "New tab"}
                                :p {"<cmd>tabprevious<cr>" "previous tab"}
                                :o {"<cmd>tabonly<cr>" "close other tabs"} 
                                :m {"<cmd>tab sp<cr>" "open current buffer in new tab"}
                                :m {"<cmd>tab sp<cr>" "open current buffer in new tab"}}})

              (wk.register {:w {:name "windows"}
                            :prefix "<leader>"}))

            (set vim.o.timeoutlen 300))
    :opts {}})]

