(local u (require :util))

[
 ; (u.tx :MeanderingProgrammer/markdown.nvim
 ;  {:dependencies [:nvim-treesitter/nvim-treesitter]
 ;   :config (fn [] 
 ;               ((. (require :render-markdown) :setup)))}) 
 ;

 (u.tx
  :OXY2DEV/markview.nvim
  {:lazy false
   :dependencies [:nvim-treesitter/nvim-treesitter
                  :nvim-tree/nvim-web-devicons]
   :opts {:code_blocks {:style :language
                        :hl :CursorLine}
          :inline_codes {:hl :CursorLine}
          :headings {:enable true
                     :heading_1 {:hl "@markup.heading.1"}
                     :heading_2 {:hl "@markup.heading.2"}
                     :heading_3 {:hl "@markup.heading.3"}
                     :heading_4 {:hl "@markup.heading.4"}
                     :heading_5 {:hl "@markup.heading.5"}
                     :heading_6 {:hl "@markup.heading.6"}}}})
 (u.tx
  :jubnzv/mdeval.nvim)

 (u.tx
  :epwalsh/obsidian.nvim
  {:version "*"
   :lazy false
   :ft :markdown
   :dependencies [:nvim-lua/plenary.nvim]
   :opts {:workspaces [{:name "notes"
                        :path "~/workspace/spaceba.by/notes"}]
          :attachments {:img_folder "assets/images"}
          :daily_notes {:folder "daily"
                        :date_format "%Y/%m/%Y.%m.%d"
                        :template nil}
          :sort_by :modified
          :sort_reversed true
          :open_notes_in :vsplit
          :external_link_icon {:char ""
                               :hl_group "ObsidianExtLinkIcon"}
          :follow_url_func (fn [url] (vim.fn.jobstart ["open" url]))
          :hl_groups {:ObsidianTodo {:bold true :fg "#f78c6c"}}}})]

