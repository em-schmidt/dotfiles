(module config.plugin.treesitter
  {autoload {treesitter nvim-treesitter.configs}})

  (treesitter.setup
    {:ensure_installed ["clojure" "fennel" "markdown" "org" "hcl" "json"]
     :sync_intall true
     :indent {:enable true}
     :highlight {:enable true
                 :additional_vim_regex_hightlighting false}})
