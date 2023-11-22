;;
;; ensure lazy is bootstrapped so we can get everything else
;;
(local packpath (.. (vim.fn.stdpath "data") "/lazy"))
(local lazypath (.. packpath "/lazy.nvim"))
(local mappings (require :mappings))

(if (not (vim.loop.fs_stat lazypath))
    (vim.fn.system [
                    "git"
                    "clone"
                    "--filter=blob:none"
                    "https://github.com/folke/lazy.nvim.git"
                    "--branch=stable"
                    lazypath]))

(vim.opt.rtp:prepend lazypath)

;; 
;;set global options
;;
;; TODO: move to a options modules
;; 
(set vim.g.loaded_netrw 1) ;; for nvim-tree
(set vim.g.loaded_netrwPlugin 1) ;; for nvim-tree
(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

(set vim.o.clipboard "unnamedplus")
(set vim.o.completeopt "menu,menuone,noselect")
(set vim.o.encoding "utf-8")
(set vim.o.expandtab true)
(set vim.o.fillchars "vert:┃")
(set vim.o.hlsearch true)
(set vim.o.ignorecase true)
(set vim.o.list true)
(set vim.o.wrap false)
(set vim.o.listchars "tab:▶-,trail:•,extends:»,precedes:«")
(set vim.o.mouse "a")
(set vim.o.number true)
(set vim.o.pumheight 5)
(set vim.o.relativenumber true)
(set vim.o.ruler true)
(set vim.o.shiftwidth 2)
(set vim.o.signcolumn "auto:2")
(set vim.o.smartcase true)
(set vim.o.spelllang "en_us")
(set vim.o.splitbelow true)
(set vim.o.splitright true)
(set vim.o.tabstop 2)
(set vim.o.termguicolors true)
(set vim.o.wildmenu true)

(mappings.create_keymaps)

(local lazy (require "lazy")) 

;; loads all plugin definitions in lua/plugins
(lazy.setup :plugins)
