(local u (require :util))

[(u.tx :tpope/vim-fugitive)

 (u.tx :SuperBo/fugit2.nvim
    {:opts {}
           :libgit2_path "/opt/homebrew/lib/libgit2.dylib"
     :dependencies [:MunifTanjim/nui.nvim
                    :nivm-tree/nvim-web-devicons
                    :nvim-lua/plenary.nvim
                    :sindrets/diffview.nvim]})  

 (u.tx :sindrets/diffview.nvim
   {:opts {}})

 (u.tx :lewis6991/gitsigns.nvim
    {:opts {}})]
