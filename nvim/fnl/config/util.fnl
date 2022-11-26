(module config.util
  {autoload {core aniseed.core

             nvim aniseed.nvim}})

(defn expand
  [path]
  (nvim.fn.expand path))

(defn glob
  [path]
  (nvim.fn.glob path true true true))

(defn exists?
  [path]
  (= (nvim.fn.filereadable path) 1))

(defn lua-file
  [path]
  (nvim.ex.luafile path))

(def config-path (nvim.fn.stdpath "config"))

(defn insert-keymap
  [from to]
  (let [map-opts {:noremmap true}
        to (.. ":" to "<cr>")]
    (nvim.set_keymap :i from to map-opts)))

(defn nnoremap
  [from to desc]
  (let [map-opts {:noremap true :desc desc}
        to (.. ":" to "<cr>")]
    (nvim.set_keymap :n from to map-opts)))

(defn lnnoremap
  [from to desc]
  (nnoremap (.. "<leader>" from) to desc))

(defn set-global-option
  [key value]
  "Sets a nvim global option"
  (core.assoc nvim.o key value))

(defn set-global-variable
  [key value]
  "Sets a nvim global variable"
  (core.assoc nvim.g key value))

