(module config.plugin.blame
  {autoload {blame blame_line
             util config.util}})

(blame.setup)

(util.lnnoremap :gb "BlameLineToggle<CR>")
