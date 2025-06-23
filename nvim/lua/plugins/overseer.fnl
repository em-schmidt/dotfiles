(local u (require :util))

;; https://github.com/stevearc/overseer.nvim
(u.tx :stevearc/overseer.nvim
  {:opts {
          :templates ["builtin" 
                      "clojure"
                      "terraform"]}})

