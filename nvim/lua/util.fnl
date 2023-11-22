
(local fun (require :vendor.fun))

(fn nnoremap
  [keys command description]
  "normal mode keymap"
  (let [map-opts {:noremap true :desc description}
        to-command (.. ":" command "<cr>")]
    ;;(print (.. "mapping " keys " --> " to-command " with description: " description))
    (vim.keymap.set :n keys to-command map-opts)))

(fn lnnoremap
  [keys command description]
  "normal mode leader keymap"
  (nnoremap (.. "<leader>" keys) command description))

;;some funcitons from olical's dotfiles
(fn last [xs]
  (fun.nth (fun.length xs) xs))

(fn tx [...]
  "Slightly nicer syntax for things like defining dependencies.
  Anything that relies on the {1 :foo :bar true} syntax can use this."

  (let [args [...]
        len (fun.length args)]
    (if (= :table (type (last args)))
      (fun.reduce
        (fn [acc n v]
          (tset acc n v)
          acc)
        (last args)
        (fun.zip (fun.range 1 len) (fun.take (- len 1) args)))
      args)))

{
 : tx
 : lnnoremap
 : nnoremap}


