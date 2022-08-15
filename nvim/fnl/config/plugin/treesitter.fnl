(module config.plugin.treesitter)

(let [(ok? ts) (pcall require :nvim-treesitter-configs)]
  (when ok?
    (ts.setup
              {:indent {:enable true}
               :highlight {:enable true
                           :additional_vim_regex_hightlighting flase}})))
