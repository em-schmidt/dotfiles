(local u (require :util))

(fn set_options
 []
 (let [globals {:loaded_node_provider 0
                :loaded_perl_provider 0
                :loaded_python3_provider 0
                :loaded_ruby_provider 0
                :mapleader " "
                :maplocalleader ","}
       options {:termguicolors true
                 :signcolumn "auto:2"
                 :conceallevel 2
                 :completeopt "menu,menuone,noselect"
                 :encoding "utf-8"
                 :expandtab true
                 :fillchars "vert:┃"
                 :guifont "JetBrainsMono Nerd Font:h18"
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

    (each [key value (pairs globals)]
      (u.set_vim_global key value))

    (each [key value (pairs options)]
      (u.set_vim_option key value))

    (vim.filetype.add {:extension {:tf :terraform}})))

{: set_options}
