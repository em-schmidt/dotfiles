(module config.mapping
   {autoload {nvim aniseed.nvim
              util config.util}})

;; Just a placeholder for future mappings, currently keeping vim and nvim in sync
;; If nvim only mappings occur, define them here.
;; Otherwise, define in .vimrc

(defn- noremap [mode from to]
  "Sets a mapping with {:noremap true}."
  (nvim.set_keymap mode from to {:noremap true}))

