(module config.plugin.cmp
  {autoload {nvim aniseed.nvim
             cmp cmp
             luasnip luasnip
             lspkind lspkind}})

(set nvim.o.completeopt "menu,menuone,noselect")
(set nvim.o.pumheight 5) ; popup menu height (completions, etc)

(def- cmp-src-menu-items
  {:buffer "buff"
   :conjure "conj"
   :nvim_lsp "lsp"
   :vsnip "vsnp"
   :luasnip "lsnp"})

(def- cmp-srcs
  [{:name :nvim_lsp}
   {:name :conjure}
   {:name :buffer}
   {:name :vsnip}
   {:name :luasnip}])

(fn has-words-before []
  (let [(line col) (unpack (vim.api.nvim_win_get_cursor 0))]
    (and (not= col 0)
         (= (: (: (. (vim.api.nvim_buf_get_lines 0 (- line 1) line true) 1) :sub col col) :match "%s") nil))))



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

            :snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
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

