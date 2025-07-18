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
   {:dependencies [:nvim-tree/nvim-web-devicons
                   :AndreM222/copilot-lualine
                   :franco-ruggeri/codecompanion-lualine.nvim]
    :opts {:extensions ["nvim-tree"
                        "toggleterm"
                        "trouble"
                        "fugitive"
                        "lazy"
                        "overseer"
                        "snacks"]
                        
           :options {:theme :auto
                     :component_separators "|"
                     :section_separators {:left "" :right ""}
                     :always_show_tabline false}
           :sections {:lualine_a [(u.tx :mode
                                        {:separator {:left ""}
                                         :right_padding 1})]
                      :lualine_b [[:filename {:filestatus true
                                              :path 1}]]
                      :lualine_c [[:branch]
                                  [:diff]]
                      :lualine_x [[:diagnostics]
                                  [:overseer]
                                  [:codecompanion]]
                      :lualine_y [[:filetype] [:progress]]
                      :lualine_z [(u.tx :location 
                                        {:separator {:right ""}
                                         :left_padding 1})]}
           :tabline {:lualine_z [(u.tx :tabs {:mode 2})]}}})]

