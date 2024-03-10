(local u (require :util))

[(u.tx
  :epwalsh/obsidian.nvim
  {:version "*"
   :lazy false
   :ft :markdown
   :dependencies [:nvim-lua/plenary.nvim]
   :opts {:workspaces [{:name "notes"
                        :path "~/workspace/spaceba.by/notes"}]
          :attachments {:img_folder "assets/images"}
          :daily_notes {:folder "daily"
                        :date_format "%Y.%m.%d"
                        :template nil}
          :sort_by :modified
          :sort_reversed true
          :open_notes_in :vsplit
          :external_link_icon {:char ""
                               :hl_group "ObsidianExtLinkIcon"}
          :follow_url_func (fn [url] (vim.fn.jobstart ["open" url]))
          :hl_groups {:ObsidianTodo {:bold true :fg "#f78c6c"}}}})]

