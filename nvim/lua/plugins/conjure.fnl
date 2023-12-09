(local u (require :util))

[
 (u.tx
   :olical/conjure
   {
     :ft [:clojure :fennel :python]
     :init (fn [] 
       ;; set config options here
            (vim.api.nvim_create_autocmd :BufNewFile 
                                         {
                                          :group (vim.api.nvim_create_augroup :conjure_log_disable_lsp {:clear true})
                                          :pattern "conjure-log-*" 
                                          :callback (fn [] (vim.diagnostic.disable 0))
                                          :desc "Conjure Log disable LSP diagnostics"})
            (set vim.g.conjure#eval#result_register "*")
            (set vim.g.conjure#log#botright true)
            (set vim.g.conjure#log#wrap true)
            (set vim.g.conjure#log#fold#enabled true)
            (set vim.g.conjure#mapping#doc_word "gk")
            (set vim.g.conjure#highlight#enabled true)
            (set vim.g.conjure#highlight#group "IncSearch")
            (set vim.g.conjure#highlight#timeout 500)
            (set vim.g.conjure#log#hud#width 1)
            (set vim.g.conjure#log#hud#enabled true)
            (set vim.g.conjure#log#hud#anchor "SE")
            (set vim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled true)
            (set vim.g.conjure#client#clojure#nrepl#connection#auto_repl#hidden true)
            (set vim.g.conjure#client#clojure#nrepl#test#runner "kaocha")
            (set vim.g.conjure#client#clojure#nrepl#test#raw_out true))})]
       
   
   



