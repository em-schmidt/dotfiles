(local u (require :util))

(fn set_options
  []
  (let [globals {:loaded_netrw 1 ;;nvim-tree
                 :loaded_netwrwPlugin 1 ;;nvim-tree
                 :mapleader " "
                 :maplocalleader ","}
        options {:termguicolors true
                 :signcolumn "auto:2"
                 :clipboard "unnamedplus"
                 :completeopt "menu,menuone,noselect"
                 :encoding "utf-8"
                 :expandtab true
                 :fillchars "vert:┃"
                 :hlsearch true
                 :ignorecase true
                 :list true
                 :wrap false
                 :listchars "tab:▶-,trail:•,extends:»,precedes:«"
                 :mouse "a"
                 :number true
                 :pumheight 5
                 :relativenumber true
                 :ruler true
                 :shiftwidth 2
                 :smartcase true
                 :spelllang "en_us"
                 :splitbelow true
                 :splitright true
                 :tabstop 2
                 :wildmenu true}]
    (each [key value (pairs options)]
      (u.set_vim_option key value))))

;; (set_options)

;; once more into the breach dear friends once more or close the wall up with our english dead

{: set_options}
