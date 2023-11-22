(local u (require :util))

[(u.tx
   :goolord/alpha-nvim
   {:dependencies [:nvim-tree/nvim-web-devicons]
    :config (fn [] (let [config (. (require "alpha.themes.startify") :config)]
                    ((. (require "alpha") :setup) config)))
    :opts {}})]
   
