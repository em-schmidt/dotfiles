(module config.mapping
   {autoload {nvim aniseed.nvim
              util config.util}})

(defn- noremap [mode from to]
  "Sets a mapping with {:noremap true}."
  (nvim.set_keymap mode from to {:noremap true}))

