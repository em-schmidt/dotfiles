-- Attempting to do a merged vim/nvim config that preserves existing ~/.vimrc 
-- and adds nvim specific config as fennel, this is the bootstrap glue
-- inspiration: https://github.com/rafaeldelboni/nvim-fennel-lsp-conjure-as-clojure-ide

local opt = vim.opt

opt.runtimepath:prepend("~/.vim")
opt.packpath:prepend("~/.vim")
vim.cmd('source ~/.vimrc')
