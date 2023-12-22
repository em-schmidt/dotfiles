(local u (require :util))

[
 (u.tx :zbirenbaum/copilot-cmp
   {:dependencies [:zbirenbaum/copilot.lua]
    :config (fn []
              ((. (require :copilot) :setup) {})
              ((. (require :copilot_cmp) :setup) {}))})

 (u.tx
  :hrsh7th/nvim-cmp
  {:dependencies [:hrsh7th/cmp-buffer
                  :hrsh7th/cmp-cmdline
                  :hrsh7th/cmp-path
                  :onsails/lspkind.nvim
                  :PaterJason/cmp-conjure
                  :saadparwaiz1/cmp_luasnip
                  :L3MON4D3/LuaSnip]
   :config (fn []
             (let [cmp (require :cmp)
                   lspkind (require :lspkind)
                   luasnip (require :luasnip)]
               (set vim.o.completeopt "menu,menuone,noselect")
               (cmp.setup {:experimental {:ghost_text {:hl_group :Comment}}
                           :formatting {:fields [:abbr :kind :menu]
                                        :format (lspkind.cmp_format {:maxwidth 50
                                                                     :mode :symbol
                                                                     :symbol_map {:Copilot ""}})}
                           :mapping {
                                     :<c-space> (cmp.mapping (cmp.mapping.complete {:i :c}))
                                     :<cr> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert
                                                                 :select true})
                                     :<c-e> (cmp.mapping {:i (cmp.mapping.abort)}) 
                                     :<tab> (cmp.mapping (fn [fallback]
                                                           (if (cmp.visible) (cmp.select_next_item)
                                                               (luasnip.expand_or_jumpable) (luasnip.expand_or_jump)
                                                               :else (fallback)))
                                                        {1 :i 2 :s}) 
                                     :<s-tab> (cmp.mapping (fn [fallback]
                                                             (if (cmp.visible)
                                                                 (cmp.select_prev_item)
                                                                 (luasnip.jumpable -1) (luasnip.jump -1)
                                                                 :else (fallback)))
                                                          {1 :i 2 :s})}
                           :snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
                           :sources [{:name :nvim_lsp}
                                     {:name :copilot}
                                     {:name :conjure}
                                     {:name :buffer}
                                     {:name :luasnip}]})
               (local cmp (require :cmp))
               (cmp.setup.cmdline :/ {:mapping (cmp.mapping.preset.cmdline)
                                      :sources [{:name :buffer}]})

               (cmp.setup.cmdline :: {:mapping (cmp.mapping.preset.cmdline)
                                      :sources (cmp.config.sources [{:name :path}
                                                                    {:name :cmdline}])})))})]
