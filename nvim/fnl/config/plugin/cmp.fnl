(module config.plugin.cmp
  {autoload {nvim aniseed.nvim}})

(set nvim.o.completeopt "menu,menuone,noselect")
(set nvim.o.pumheight 5) ; popup menu height (completions, etc)

(let [(ok? cmp) (pcall require :cmp)]

  (when ok?
    (let [snip (require :luasnip)
          lspkind (require :lspkind)]

      (cmp.setup {:experimental {:ghost_text true}
                  :formatting {:fields [:abbr :kind :menu]
                               :format (lspkind.cmp_format {:maxwidth 50
                                                            :menu {
                                                                   :buffer (..  "[" "Buffer" "]")
                                                                   :conjure (.. "[" "Conjure" "]")
                                                                   :nvim_lsp (.. "[" "LSP" "]")
                                                                   }
                                                            :mode :symbol
                                                            })}
                  :mapping {
                            :<c-space> (cmp.mapping (cmp.mapping.complete {:i :c}))
                            :<cr> (cmp.mapping.confirm {:behvior cmp.ConfirmBehavior.Insert
                                                        :select true})
                            :<c-e> (cmp.mapping {:i (cmp.mapping.abort)})
                            :<tab> (cmp.mapping (fn [fallback]
                                                  (if (cmp.visible)
                                                    (cmp.select_next_item)
                                                    (fallback))))
                            :<s-tab> (cmp.mapping (fn [fallback]
                                                  (if (cmp.visible)
                                                    (cmp.select_prev_item)
                                                    (fallback))))
                            }

                  :snippet {:expand (fn [args] (snip.lsp_expand args.body))}
                  :sources [
                            {:name :conjure}
                            {:name :nvim_lsp}
                            {:name :buffer}
                            {:name :cmdline}
                            {:name :luasnip}
                            {:name :path}
                          ]
                })

      (cmp.setup.cmdline :/ {:mapping (cmp.mapping.preset.cmdline)
                              :sources [
                                        {:name :buffer}
                                        ]})

      (cmp.setup.cmdline :: {:mapping (cmp.mapping.preset.cmdline)
                              :sources (cmp.config.sources [
                                                            {:name :path}
                                                            {:name :cmdline}
                                                            ])})
      )))

