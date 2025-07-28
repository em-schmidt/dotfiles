(local u (require :util))

[(u.tx
   :folke/which-key.nvim
   {:event :VeryLazy
    :dependencies [:echasnovski/mini.icons]
    :init (fn []
            (let [wk (require "which-key")]

              (wk.add [(u.tx :<leader>a {:group "AI"})])

              (wk.add [(u.nlkm :.         :ToggleTerm          "toggle terminal")
                       (u.nlkm :<tab>     :b#                  "next buffer")
                       (u.nlkm :+         "resize +3"          "increase height") 
                       (u.nlkm :=         "resize +3"          "increase height") 
                       (u.nlkm :-         "resize -3"          "decrease height") 
                       (u.nlkm :<char-62> "vertical resize +3" "increase width") 
                       (u.nlkm :<lt>      "vertical resize -3" "decrease width")]) 

              (wk.add [(u.tx :<leader>b {:group :buffers})
                       (u.nlkm :ba :ball               "open all buffers")
                       (u.nlkm :bd :bdelete            "delete current buffer")
                       (u.nlkm :bn :bnext              "next buffer")
                       (u.nlkm :bp :bprevious          "previous buffer")])

              (wk.add [(u.tx :<leader>e {:group :errors})
                       (u.nlkm :et "Trouble diagnostics toggle" "toggle diagnostics view")])

              (wk.add [(u.tx :<leader>f {:group :files})])

              (wk.add [(u.tx :<leader>g {:group :git})
                       (u.nlkm :gb
                               "Gitsigns toggle_current_line_blame"
                               "toggle git blame")
                       (u.nlkm :gd
                               "DiffviewOpen"
                               "git difftool")
                       (u.nlkm :gg
                               :Fugit2
                               "fugit2")
                       (u.nlkm :gp
                               "Git pull"
                               "git pull")
                       (u.nlkm :gP
                               "Git push"
                               "git push")])

              (wk.add [(u.tx :<leader>l {:group :lsp})]) 

              (wk.add [(u.tx :<leader>m {:group :markdown}) 
                       (u.nlkm :mt 
                               "Markview toggle"
                               "toggle markdown rendering")]) 

              (wk.add [(u.tx :<leader>n {:group :notes})
                       (u.nlkm :nT 
                               "vimgrep /- \\[ \\]/ **/* |Trouble quickfix" 
                               "unchecked todos")])

              (wk.add [(u.tx :<leader>o {:group :overseer})
                       (u.nlkm :or :OverseerRun    "run task")
                       (u.nlkm :ot :OverseerToggle "toggle overseer")])

              (wk.add [(u.tx :<leader>p {:group :projects})])

              (wk.add [(u.tx :<leader>P {:group :plugins})
                       (u.nlkm :Pl 
                               :Lazy
                               "plugin manager (lazy.nvim)")
                       (u.nlkm :Pm
                               :Mason
                               "lsp manager (mason)")])

              (wk.add [(u.tx :<leader>r> {:group :run})
                       (u.tx :<leader>rv
                            "<cmd>ToggleTermSendVisualLines<cr>"
                            {:desc "run visual selection in terminal"
                             :mode :v})]) 

              (wk.add [(u.tx :<leader>t {:group :tabs})
                       (u.nlkm :td :tabclose 
                               "close current tab")
                       (u.nlkm :tn :tabnext
                               "next tab")
                       (u.nlkm :tN :tabnew
                               "new tab")
                       (u.nlkm :tp :tabprevious
                               "previous tab")
                       (u.nlkm :to :tabonly
                               "close other tabs")
                       (u.nlkm :tm "tab sp"
                               "open current buffer in new tab")])


              (wk.add [(u.tx :<leader>w {:group :windows})
                       (u.nlkm :wh "wincmd h"
                               "window left")
                       (u.nlkm :wj "wincmd j"
                               "window down")
                       (u.nlkm :wk "wincmd k"
                               "window up")
                       (u.nlkm :wl "wincmd l"
                               "window right")
                       (u.nlkm :w1 "1 wincmd w"
                               "window 1")
                       (u.nlkm :w2 "2 wincmd w"
                               "window 2")
                       (u.nlkm :w3 "3 wincmd w"
                               "window 3")
                       (u.nlkm :wo "only"
                               "close other windows")
                       (u.nlkm :wn "split"
                               "split (horizontal)")
                       (u.nlkm :w| "vsplit"
                               "split (vertical)")
                       (u.nlkm :wq "close"
                               "close")]))

            (set vim.o.timeoutlen 300))
    :opts {}})]

