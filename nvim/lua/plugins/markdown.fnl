(local u (require :util))

(fn note_id_func [title]
  (var suffix "")
  (if (not= title nil) (set suffix
                             (: (: (title:gsub " " "-") :gsub
                                   "[^A-Za-z0-9-]" "")
                                :lower))
      (for [_ 1 4]
        (set suffix (.. suffix (string.char (math.random 65 90))))))
  (.. (tostring (os.date "%Y.%m.%d")) "-" suffix))

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
   {:config (fn [] ((. (require :markdown-table-mode) :setup)))
    :keys
      [(u.nlkm :mT "Mtm" "toggle markdown table mode")]})

 ;; https://github.com/obsidian-nvim/obsidian.nvim
 (u.tx
  :obsidian-nvim/obsidian.nvim
  {:version "*"
   :lazy true
   :ft :markdown
   :dependencies [:nvim-lua/plenary.nvim
                  :OXY2DEV/markview.nvim]
   :opts {:workspaces [{:name "notes"
                        :path "~/workspace/spaceba.by/notes"}]
          :ui {:enable false}
          :attachments {:folder "assets/images"}
          :daily_notes {:folder "daily"
                        :date_format "%Y/%m/%Y.%m.%d"
                        :template "daily.md"}
          :search {:sort_by :modified
                   :sort_reversed true}
          :templates {:folder ".obsidian/templates"
                      :date_format "%YYYY-%MM-%DD"
                      :time_format "%H:%mm"
                      :substitutions {:human_today (fn [] (os.date "%B %d, %Y"))}}
          :legacy_commands false
          :hl_groups {:ObsidianTodo {:bold true :fg "#f78c6c"}}
          :note_id_func note_id_func}
   :keys 
     [(u.nlkm :nb "Obsidian backlinks" "incoming links")
      (u.nlkm :nt "Obsidian today" "today's note")
      (u.nlkm :nl "Obsidian links" "incoming links")
      (u.nlkm :nN "Obsidian template" "new note from template")
      (u.nlkm :nn "Obsidian dailies -10" "note picker")
      (u.nlkm :np "Obsidian paste_img" "paste image")
      (u.nlkm :nr "Obsidian rename" "rename current note")
      (u.vlkm :ne "Obsidian extract_note" "extract note")]})]


