(local u (require :util))

[
 (u.tx :zbirenbaum/copilot.lua)

 (u.tx
   :L3MON4D3/LuaSnip
   {:build "make install_jsregexp"})

 (u.tx
  :hrsh7th/nvim-cmp
  {:dependencies [:hrsh7th/cmp-buffer
                  :hrsh7th/cmp-nvim-lsp
                  :hrsh7th/cmp-cmdline
                  :hrsh7th/cmp-path
                  :onsails/lspkind.nvim
                  :PaterJason/cmp-conjure
                  :saadparwaiz1/cmp_luasnip
                  :L3MON4D3/LuaSnip]
   :config (fn []
             (let [cmp (require :cmp)
                   lspkind (require :lspkind)
                   luasnip (require :luasnip)
                   has-words-before-cursor? (fn []
                                              (let [(line col) (unpack (vim.api.nvim_win_get_cursor 0))]
                                                (and (not= col 0)
                                                     (= (: (: (. (vim.api.nvim_buf_get_lines 0 (- line 1) line true) 1) :sub col col) :match "%s") nil))))]
               (set vim.o.completeopt "menu,menuone,noselect")
               (cmp.setup {:experimental {:ghost_text {:hl_group :Comment}}
                           :formatting {:fields [:abbr :kind :menu]
                                        :format (lspkind.cmp_format {:maxwidth 50
                                                                     :mode :symbol_text})}
                           :mapping {
                                     :<c-space> (cmp.mapping (cmp.mapping.complete))
                                     :<cr> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert
                                                                 :select true})
                                     :<c-e> (cmp.mapping {:i (cmp.mapping.abort)}) 
                                     :<tab> (cmp.mapping (fn [fallback]
                                                           (if (cmp.visible) (cmp.select_next_item)
                                                               (luasnip.expand_or_jumpable) (luasnip.expand_or_jump)
                                                               (has-words-before-cursor?) (cmp.complete)
                                                               (fallback)))
                                                        {1 :i 2 :s}) 
                                     :<s-tab> (cmp.mapping (fn [fallback]
                                                             (if (cmp.visible) (cmp.select_prev_item)
                                                                 (luasnip.jumpable -1) (luasnip.jump -1)
                                                                 (fallback)))
                                                          {1 :i 2 :s})}
                           :snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
                           :sources (cmp.config.sources [{:name :nvim_lsp}
                                                         {:name :luasnip}
                                                         {:name :conjure}
                                                         {:name :buffer}
                                                         {:name :path}])
                           :window {:completion (cmp.config.window.bordered)
                                    :documentation (cmp.config.window.bordered)}})

               (cmp.setup.cmdline [:/ :?] {:mapping (cmp.mapping.preset.cmdline)
                                            :sources [{:name :buffer}]})

               (cmp.setup.cmdline :: {:mapping (cmp.mapping.preset.cmdline)
                                      :sources (cmp.config.sources [{:name :path}
                                                                    {:name :cmdline}])})))})]
