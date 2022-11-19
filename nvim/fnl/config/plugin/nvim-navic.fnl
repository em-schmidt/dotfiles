(module config.plugin.nvim-navic
  {autoload {nvim aniseed.nvim
             nvim-navic nvim-navic}})

(nvim-navic.setup {:separator "."})

(set nvim.o.winbar "%{%v:lua.require'nvim-navic'.get_location()%}")
