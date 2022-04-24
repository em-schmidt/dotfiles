(module cofing.core
  {autoload {nvim aniseed.nvim}})

(set nvim.o.termguicolors true)
(set nvim.o.mouse "a")
(set nvim.o.updatetime 500)
(set nvim.o.timeoutlen 500)
(set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")
(set nvim.o.inccommand :nosplit)

(nvim.ex.set :nospell)
(nvim.ex.set :list)
