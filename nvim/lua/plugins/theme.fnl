(local u (require :util))

[(u.tx
  :projekt0n/github-nvim-theme
  {:lazy false
   :priority 1000
   :config (fn []
             (. (require "github-theme") :setup)
            (vim.cmd "colorscheme github_light"))})

 (u.tx
   :f-person/auto-dark-mode.nvim
   {:opts {:update_interval 1000
           :set_dark_mode (fn []
                             (vim.api.nvim_set_option :background "dark")
                             (vim.cmd "colorscheme github_dark"))
           :set_light_mode (fn []
                             (vim.api.nvim_set_option :background "light")
                            (vim.cmd "colorscheme github_light"))}})

 (u.tx :SmiteshP/nvim-navic
   {:config (fn []
              (. (require "nvim-navic") :setup)
              (set vim.o.winbar "%{%v:lua.require'nvim-navic'.get_location()%}"))})

 (u.tx :nvim-lualine/lualine.nvim
   {:dependencies [:nvim-tree/nvim-web-devicons]
    :opts {:options {:theme :auto
                     :component_separators ""
                     :section_separators ""}
           :sections {:lualine_a [[:mode {:upper true}]]
                      :lualine_b [[:filename {:filestatus true
                                              :path 1}]]
                      :lualine_c [[:branch]
                                  [:diff]]
                      :lualine_x [[:diagnostics]]
                      :lualine_y [[:location]]
                      :lualine_z [[:filetype]]}}})]


 



