(local u (require :util))

[(u.tx
   :nvim-telescope/telescope.nvim
   {:branch "0.1.x"
    :dependencies [
                   :nvim-lua/plenary.nvim
                   :nvim-telescope/telescope-ui-select.nvim
                   :nvim-telescope/telescope-project.nvim
                   :TC72/telescope-tele-tabby.nvim]

    :config (fn []
              (let [telescope (require :telescope)
                    themes (require :telescope.themes)]
                (telescope.setup 
                  {
                   :defaults {:file_ignore_patterns ["node_modules"]}
                   :extensions {
                                :tele_tabby {:use_highlighter true}
                                :project {:base_dirs ["~/workspace"]
                                          :theme :dropdown
                                          :order_by :recent
                                          :sync_with_nvim_tree true}}
                   :pickers {:buffers {:show_all_buffers true
                                       :sort_lastused true
                                       :mappings {:n {:x :delete_buffer}}}}})
                (telescope.load_extension "ui-select")
                (telescope.load_extension "notify")
                (telescope.load_extension "project")
                (telescope.load_extension "tele_tabby")))})]
   
