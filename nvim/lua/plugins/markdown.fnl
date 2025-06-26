(local u (require :util))

[;; https://github.com/OXY2DEV/markview.nvim/
 (u.tx
  :OXY2DEV/markview.nvim
  {:lazy false
   :dependencies [:nvim-tree/nvim-web-devicons
                  :echasnovski/mini.icons]
   :config (fn [] (let [presets (. (require :markview.presets))]
                    ((. (require :markview) :setup) 
                     {:markdown {:code_blocks {:style :simple}
                                 :headings (. presets :headings :glow)
                                 :horizontal_rules (. presets :horizontal_rules :thick)
                                 :tables (. presets :tables :rounded)}
                      :experimental {:check_rtp_message false}
                      :preview {:filetypes ["markdown" "codecompanion"]
                                :ignore_buftypes []}})))})

 ;; https://github.com/jubnzv/mdeval.nvim
 (u.tx
  :jubnzv/mdeval.nvim)

 ;; https://github.com/Kicamon/markdown-table-mode.nvim
 (u.tx
   :Kicamon/markdown-table-mode.nvim
   {:config (fn [] ((. (require :markdown-table-mode) :setup)))})

 ;; https://github.com/obsidian-nvim/obsidian.nvim
 (u.tx
  :obsidian-nvim/obsidian.nvim
  {:version "*"
   :lazy true
   :ft :markdown
   :dependencies [:nvim-lua/plenary.nvim]
   :opts {:workspaces [{:name "notes"
                        :path "~/workspace/spaceba.by/notes"}]
          :ui {:enable false}
          :attachments {:img_folder "assets/images"}
          :daily_notes {:folder "daily"
                        :date_format "%Y/%m/%Y.%m.%d"
                        :template nil}
          :sort_by :modified
          :sort_reversed true
          :open_notes_in :vsplit
          :follow_url_func (fn [url] (vim.fn.jobstart ["open" url]))
          :hl_groups {:ObsidianTodo {:bold true :fg "#f78c6c"}}}
   :keys 
     [(u.nlkm :nt :ObsidianToday "today's note")
      (u.nlkm :nn "Obsidian dailies -10" "note picker")]})]

