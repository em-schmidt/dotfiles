(local u (require :util))

[
 (u.tx
   :olical/conjure
   {
     :ft [:clojure :fennel :python]
     :init (fn [] 
       ;; set config options here
            (let [eval (require :conjure.eval)
                  init-portal (fn [] (eval.eval-str {:origin "portal-wrapper"
                                                     :code "(require '[portal.api :as p]) (def p (p/open)) (add-tap #'p/submit)"}))
                  on-filetype (fn [] 
                                (vim.api.nvim_buf_set_keymap 0 :n "<localleader>pi" "" {:desc "initialize portal"
                                                                                        :callback init-portal}))
                  augroup (vim.api.nvim_create_augroup :portal {})]
              (vim.api.nvim_create_autocmd :FileType
                                           {:group augroup
                                            :pattern ["clojure"]
                                            :callback on-filetype}))
            (vim.api.nvim_create_autocmd :BufNewFile
                                         {
                                          :group (vim.api.nvim_create_augroup :conjure_log_disable_lsp {:clear true})
                                          :pattern ["conjure-log-*"]
                                          :callback (fn [] (vim.diagnostic.disable 0))
                                          :desc "Conjure Log disable LSP diagnostics"})
            (tset vim.g "conjure#eval#result_register" "*")
            (tset vim.g "conjure#log#botright" true)
            (tset vim.g "conjure#log#wrap" true)
            (tset vim.g "conjure#log#fold#enabled" true)
            (tset vim.g "conjure#mapping#doc_word" "gk")
            (tset vim.g "conjure#highlight#enabled" true)
            (tset vim.g "conjure#highlight#group" "IncSearch")
            (tset vim.g "conjure#highlight#timeout" 500)
            (tset vim.g "conjure#log#hud#width" .6)
            (tset vim.g "conjure#log#hud#enabled" true)
            (tset vim.g "conjure#log#hud#anchor" "NE")
            (tset vim.g "conjure#client#clojure#nrepl#connection#auto_repl#cmd" "bb -Sdeps '{:deps {djblue/portal {:mvn/version \"0.57.3\"}}}' nrepl-server localhost:$port")
            (tset vim.g "conjure#client#clojure#nrepl#connection#auto_repl#enabled" true)
            (tset vim.g "conjure#client#clojure#nrepl#connection#auto_repl#hidden" true)
            (tset vim.g "conjure#client#clojure#nrepl#test#runner" "kaocha")
            (tset vim.g "conjure#client#clojure#nrepl#test#raw_out" true))})]

