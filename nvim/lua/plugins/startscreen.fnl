(local u (require :util))

[(u.tx
  :goolord/alpha-nvim
  {:dependencies [:nvim-tree/nvim-web-devicons]
   :config (fn [] (let [dashboard (require "alpha.themes.dashboard")
                        buttons {:type :group
                                 :val [{:type :text :val "Quick Actions" :opts {:hl "Bold" :position :center}}
                                       {:type :padding :val 1}
                                       (dashboard.button :e "  New file" "<cmd>ene<cr>")
                                       (dashboard.button "SPC f f" "󰈞  Find file")
                                       (dashboard.button "SPC f /" "󰊄  Live grep")
                                       (dashboard.button "c" "  Configuration" "<cmd>cd ~/.config/nvim/ <cr>")
                                       (dashboard.button "u" "  Update plugins" "<cmd>Lazy sync<cr>")
                                       (dashboard.button "q" "󰅚  Quit" "<cmd>qa<cr>")]
                                 :position :center} 
                        config {:layout [buttons]
                                  :opts {:margin 5
                                         :setup (fn []
                                                 (vim.api.nvim_create_autocmd :DirChanged 
                                                                              {:pattern "*" 
                                                                               :callback (fn [] 
                                                                                           (. (require "alpha") :redraw)
                                                                                           (vim.cmd :AlphaRemap))}))}}]
                      ((. (require "alpha") :setup) config)))})]

