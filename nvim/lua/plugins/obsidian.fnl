(local u (require :util))

[(u.tx
  :epwalsh/obsidian.nvim
  {:version "*"
   :lazy true
   :ft :markdown
   :dependencies [:nvim-lua/plenary.nvim]
   :opts {:workspaces [{:name "notes"
                        :path "~/workspace/spaceba.by/notes"}]
          :attachments {:img_folder "assets/images"}
          :daily_notes {:folder "daily"
                        :date_format "%Y.%m.%d"
                        :template nil}}})]

