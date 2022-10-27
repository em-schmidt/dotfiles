(module config.plugin.telescope
  {autoload {nvim aniseed.nvim
             telescope telescope
             actions telescope.actions
             themes telescope.themes
             }})

(telescope.setup
  {:defaults {:file-ignore-patterns ["node_modules"]
              }
   :extensions {:env {}
                :ui-select {1 (themes.get_dropdown {})}
                :tele_tabby {:use_highlighter false}
                :packer {}
                :project {}}
   :pickers {:find-files {:find-command ["rg" "--files" "--iglob" "!.git"]}
             :buffers {:show_all_buffers true
                       :sort_lastused true
                       :mappings {:n {:x :delete_buffer}}}}})

;; Load Extensions
(telescope.load_extension "env")
(telescope.load_extension "file_browser")
(telescope.load_extension "packer")
(telescope.load_extension "ports")
(telescope.load_extension "project")
(telescope.load_extension "tele_tabby")
(telescope.load_extension "ui-select")
(telescope.load_extension "notify")
