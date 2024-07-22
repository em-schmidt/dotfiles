(local u (require :util))

[(u.tx
   :folke/which-key.nvim
   {:event :VeryLazy
    :init (fn []
            (let [wk (require "which-key")]

              (wk.add [
                       {1 :<leader>.
                        2 "<cmd>ToggleTerm<cr>"
                        :desc "toggle terminal"
                        :mode :n}
                       {1 :<leader><tab>
                        2 "<cmd>b#<cr>"
                        :desc "next buffer"
                        :mode :n}
                       {1 :<leader>+
                        2 "<cmd>resize +3<cr>"
                        :desc "increase height"
                        :mode :n}
                       {1 :<leader>=
                        2 "<cmd>resize +3<cr>"
                        :desc "increase height"
                        :mode :n}
                       {1 :<leader>-
                        2 "<cmd>resize -3<cr>"
                        :desc "decrease height"
                        :mode :n}
                       {1 :<leader><char-62>
                        2 "<cmd>vertical resize +3<cr>"
                        :desc "increase width"
                        :mode :n}
                       {1 :<leader><lt>
                        2 "<cmd>vertical resize -3<cr>"
                        :desc "decrease width"
                        :mode :n}])

              (wk.add [{1 :<leader>b :group "buffers"}
                       {1 :<leader>ba 
                        2 "<cmd>ball<cr>"
                        :desc "open all buffers"
                        :mode :n}
                       {1 :<leader>bb
                        2 "<cmd>Telescope buffers<cr>"
                        :desc "list buffers"
                        :mode :n}
                       {1 :<leader>bd
                        2 "<cmd>bdelete<cr>"
                        :desc "delete current buffer"
                        :mode :n}
                       {1 :<leader>bn
                        2 "<cmd>bnext<cr>"
                        :desc "next buffer"
                        :mode :n}
                       {1 :<leader>bp
                        2 "<cmd>bprevious<cr>"
                        :desc "previous buffer"
                        :mode :n}])

              (wk.add [
                       {1 :<leader>e :group "errors"}
                       {1 :<leader>et
                        2 "<cmd>Trouble diagnistics toggle<cr>"
                        :desc "toggle diagnostics view"
                        :mode :n}])

              (wk.add [
                       {1 :<leader>f :group "files"}
                       {1 :<leader>ff
                        2 "<cmd>Telescope find_files<cr>"
                        :desc "project files"
                        :mode :n}
                       {1 :<leader>f/
                        2 "<cmd>Telescope live_grep<cr>"
                        :desc "grep in workspace"
                        :mode :n}
                       {1 :<leader>ft
                        2 "<cmd>NvimTreeToggle<cr>"
                        :desc "toggle file tree"
                        :mode :n}])

              (wk.add [
                       {1 :<leader>g :group "git"}
                       {1 :<leader>gb
                        2 "<cmd>Gitsigns toggle_current_line_blame<cr>"
                        :desc "toggle git blame"
                        :mode :n}
                       {1 :<leader>gg
                        2 "<cmd>Fugit2<cr>"
                        :desc "fugit 2"
                        :mode :n}
                       {1 :<leader>gl
                        2 "<cmd>Telescope git_commits<cr>"
                        :desc "git log"
                        :mode :n}
                       {1 :<leader>gp
                        2 "<cmd>Git pull<cr>"
                        :desc "git pull"
                        :mode :n}
                       {1 :<leader>gP
                        2 "<cmd>Git push<cr>"
                        :desc "git push"
                        :mode :n}
                       {1 :<leader>gs
                        2 "<cmd>Telescope git_status<cr>"
                        :desc "git status"
                        :mode :n}])

              (wk.add [{1 :<leader>l :group "lsp"}])

              (wk.add [{1 :<leader>n :group "notes"}]
                      {1 :<leader>nn
                       2 "<cmd>ObsidianQuickSwitch<cr>"
                       :desc "note picker"
                       :mode :n}
                      {1 :<leader>nt
                       2 "<cmd>ObsidianToday<cr>"
                       :desc "today's note"
                       :mode :n}
                      {1 :<leader>nT
                       2 "<cmd>vimgrep /- \\[ \\]/ **/* | Trouble quickfix<cr>"
                       :desc "unchecked todos"
                       :mode :n})

              (wk.add [{1 :<leader>p :group "projects"}]
                     {1 :<leader>pp
                      2 "<cmd>lua require'telescope'.extensions.project.project{ display_type = 'full' }<cr>"
                      :desc "project switcher"
                      :mode :n}
                     {1 :<leader>pt
                      2 "<cmd>TodoTelescope<cr>"
                      :desc "project todos"
                      :mode :n})

              (wk.add [{1 :<leader>P :group "plugins"}]
                      {1 :<leader>Pl
                       2 "<cmd>Lazy<cr>"
                       :desc "plugin manager (lazy.nvim)"
                       :mode :n}
                      {1 :<leader>Pm
                       2 "<cmd>Mason<cr>"
                       :desc "lsp manager (mason)"
                       :mode :n})

              (wk.add [{1 :<leader>r :group "run"}
                       {1 :<leader>rv
                        2 "<cmd>ToggleTermSendVisualLines<cr>"
                        :desc "run visual selection in terminal"
                        :mode :v}])

              (wk.add [{1 :<leader>t :group "tabs"}]
                      {1 :<leader>tt
                       2 "<cmd>Telescope tele_tabby list<cr>"
                       :desc "list tabs"
                       :mode :n}
                      {1 :<leader>td
                       2 "<cmd>tabclose<cr>"
                       :desc "close current tab"
                       :mode :n}
                      {1 :<leader>tn
                       2 "<cmd>tabnext<cr>"
                       :desc "next tab"
                       :mode :n}
                      {1 :<leader>tN
                       2 "<cmd>tabnew<cr>"
                       :desc "New tab"
                       :mode :n}
                      {1 :<leader>tp
                       2 "<cmd>tabprevious<cr>"
                       :desc "previous tab"
                       :mode :n}
                      {1 :<leader>to
                       2 "<cmd>tabonly<cr>"
                       :desc "close other tabs"
                       :mode :n}
                      {1 :<leader>tm
                       2 "<cmd>tab sp<cr>"
                       :desc "open current buffer in new tab"
                       :mode :n})

              (wk.add [{1 :<leader>w :group "windows"}
                       {1 :<leader>wh 
                        2 "<cmd>wincmd h<cr>"
                        :desc "window left" :mode :n}
                       {1 :<leader>wj 
                        2 "<cmd>wincmd j<cr>"
                        :desc "window down" :mode :n}
                       {1 :<leader>wk 
                        2 "<cmd>wincmd k<cr>"
                        :desc "window up" :mode :n}
                       {1 :<leader>wl 
                        2 "<cmd>wincmd l<cr>"
                        :desc "window right" :mode :n}
                       {1 :<leader>w1 
                        2 "<cmd>1 wincmd w<cr>"
                        :desc "window 1" :mode :n}
                       {1 :<leader>w2 
                        2 "<cmd>2 wincmd w<cr>"
                        :desc "window 2" :mode :n}
                       {1 :<leader>w3 
                        2 "<cmd>3 wincmd w<cr>"
                        :desc "window 3" :mode :n}
                       {1 :<leader>wo 
                        2 "<cmd>only<cr>"
                        :desc "close other windows" :mode :n}
                       {1 :<leader>wn 
                        2 "<cmd>split<cr>"
                        :desc "split (horizontal)" :mode :n}
                       {1 :<leader>w| 
                        2 "<cmd>vsplit<cr>"
                        :desc "split (vertical)" :mode :n}
                       {1 :<leader>wq 
                        2 "<cmd>close<cr>"
                        :desc "close"}]))

            (set vim.o.timeoutlen 300))
    :opts {}})]

