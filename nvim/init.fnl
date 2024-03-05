;;
;; ensure lazy is bootstrapped so we can get everything else
;;
(local packpath (.. (vim.fn.stdpath "data") "/lazy"))
(local lazypath (.. packpath "/lazy.nvim"))
(local mappings (require :mappings))
(local options (require :options))
(local commands (require :commands))

(if (not (vim.loop.fs_stat lazypath))
    (vim.fn.system [
                    "git"
                    "clone"
                    "--filter=blob:none"
                    "https://github.com/folke/lazy.nvim.git"
                    "--branch=stable"
                    lazypath]))

(vim.opt.rtp:prepend lazypath)

(options.set_options)

(commands.register_commands)



(local lazy (require "lazy")) 

;; loads all plugin definitions in lua/plugins
(lazy.setup :plugins)

(mappings.create_keymaps)
