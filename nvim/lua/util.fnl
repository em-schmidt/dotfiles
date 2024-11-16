
(local fun (require :vendor.fun))

(fn set_vim_global
  [key value]
  (vim.api.nvim_set_var key value))

(fn set_vim_option
  [key value] 
  (vim.api.nvim_set_option_value key value {}))

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

;;some functions from olical's dotfiles
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

(fn nlkm
  [keys command description]
  "generates a normal mode leader keymap table"
  (let [lhs (.. "<leader>" keys)
        rhs (.. "<cmd>" command "<cr>")]
    (tx lhs rhs {:desc description :mode :n})))

{
 : tx
 : nlkm
 : lnnoremap
 : nnoremap
 : set_vim_option
 : set_vim_global}


