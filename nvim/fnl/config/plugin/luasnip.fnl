(module config.plugin.luasnip
  {autoload {nvim aniseed.nvim}})

(let [(ok? luasnip) (pcall require :luasnip)]

  (when ok?
    (print)
  ))

