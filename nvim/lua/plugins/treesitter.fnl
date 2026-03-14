(local u (require :util))

(fn enable_ts_for_lang [lang]
  (vim.api.nvim_create_autocmd :FileType {:pattern [lang]
                                          :callback (fn [] (vim.treesitter.start))}))

[(u.tx :nvim-treesitter/nvim-treesitter
  {
   :dependencies [:OXY2DEV/markview.nvim]
   :lazy false
   :build ":TSUpdate"
   :init (fn []
           (let [languages ["clojure"
                            "css"
                            "fennel"
                            "hcl"
                            "html"
                            "json"
                            "latex"
                            "markdown"
                            "markdown_inline"
                            "python"
                            "regex"
                            "scss"
                            "svelte"
                            "tsx"
                            "typst"
                            "vue"]]
            ((. (require :nvim-treesitter) :install) languages)
            (each [_ lang (ipairs languages)]
             (enable_ts_for_lang lang))))})] 
