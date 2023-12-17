(local u (require :util))

[(u.tx
  :nvim-tree/nvim-tree.lua
  {:version "*"
    :lazy false
    :dependencies [:nvim-tree/nvim-web-devicons]
    :config (fn [] 
              ((. (require :nvim-tree) :setup) 
               {
                :sort {:sorter :case_sensitive}
                :view {:adaptive_size true}
                :renderer {:group_empty true}
                :filters {:dotfiles true
                          :custom ["\\.lua$"]}}))})]

