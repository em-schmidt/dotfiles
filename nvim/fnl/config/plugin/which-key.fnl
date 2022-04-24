(module config.plugin.which-key)

(let [(ok? which-key) (pcall require :which-key)]
  (when ok?
    (which-key.setup {:plugins {:spelling {:enabled :true}}})
    (which-key.register {:f {:name "find (telescope)"}} {:prefix :<leader>})
    (which-key.register {:h {:name "git"}} {:prefix :<leader>})
    (which-key.register {:l {:name "lsp"}} {:prefix :<leader>})
    (which-key.register {:w {:name "window"}} {:prefix :<leader>})
    (which-key.register {:t {:name "open terminal split"}} {:prefix :<leader>})
    (which-key.register {:T {:name "open terminal tab"}} {:prefix :<leader>})
    ))

