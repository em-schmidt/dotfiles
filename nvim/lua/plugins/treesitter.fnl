(local u (require :util))

[(u.tx :nvim-treesitter/nvim-treesitter
  {
   :build (fn [] 
           (((. (require :nvim-treesitter.install) :update) {:with_sync true})))
   :config (fn []
            (let [configs (require "nvim-treesitter.configs")]
             (configs.setup {:ensure_installed
                               ["clojure"
                                "css"
                                "fennel"
                                "hcl"
                                "html"
                                "json"
                                "latex"
                                "markdown"
                                "markdown_inline"
                                "norg"
                                "regex"
                                "scss"
                                "svelte"
                                "tsx"
                                "typst"
                                "vue"]
                             :sync_install true
                             :auto_install true
                             :indent {:enable true}
                             :highlight {:enable true
                                         :additional_vim_regex_highlighting false}
                             :textobjects {:enable true}})))})]

