(local u (require :util))

[(u.tx
   :folke/which-key.nvim
   {:event :VeryLazy
    :init (fn []
            (let [wk (require "which-key")]

              (wk.register {:<leader>. ["<cmd>ToggleTerm<cr>" "toggle terminal"]
                            :<leader><tab> ["<cmd>b#<cr>" "next buffer"]
                            :<leader>+ ["<cmd>resize +3<cr>" "increase height"]
                            :<leader>= ["<cmd>resize +3<cr>" "increase height"]
                            :<leader>- ["<cmd>resize -3<cr>" "decrease height"]
                            :<leader><char-62> ["<cmd>vertical resize +3<cr>" "increase width"]
                            :<leader><lt> ["<cmd>vertical resize -3<cr>" "decrease width"]})

              (wk.register {:b {:name "buffers"
                                :a ["<cmd>ball<cr>" "open all buffers"]
                                :b ["<cmd>Telescope buffers<cr>" "list buffers"]
                                :d ["<cmd>bdelete<cr>" "delete current buffer"]
                                :n ["<cmd>bnext<cr>" "next buffer"]
                                :p ["<cmd>bprevious<cr>" "previous buffer"]}
                            :prefix "<leader>"})

              (wk.register {:e {:name "errors"
                                :t ["<cmd>TroubleToggle<cr>" "toggle trouble view"]}
                            :prefix "<leader>"})

              (wk.register {:f {:name "files"
                                :/ ["<cmd>Telescope live_grep<cr>" "grep in workspace"]
                                :f ["<cmd>Telescope find_files<cr>" "project files"]
                                :s ["<cmd>write<cr>" "save current file"]
                                :t ["<cmd>NvimTreeToggle<cr>" "toggle file tree"]}
                            :prefix "<leader>"})

              (wk.register {:g {:name "git"
                                :b ["<cmd>Gitsigns toggle_current_line_blame<cr>" "toggle git blame"]
                                :s ["<cmd>Telescope git_status<cr>" "git status"]
                                :l ["<cmd>Telescope git_commits<cr>" "git log"]}
                            :prefix "<leader>"})

              (wk.register {:l {:name "lsp"}
                            :prefix "<leader>"})

              (wk.register {:p {:name "projects"
                                :t ["<cmd>TodoTelescope<cr>" "project todos"]
                                :p ["<cmd>lua require'telescope'.extensions.project.project{ display_type = 'full' }<cr>" "project switcher"]}
                            :prefix "<leader>"})

              (wk.register {:P {:name "plugins"
                                :l ["<cmd>Lazy<cr>" "plugin manager (lazy.nvim)"]
                                :m ["<cmd>Mason<cr>" "lsp manager (mason)"]}
                            :prefix "<leader>"})

              (wk.register {:t {:name "tabs"
                                :t ["<cmd>Telescope tele_tabby list<cr>" "list tabs"] 
                                :d ["<cmd>tabclose<cr>" "close current tab"]
                                :n ["<cmd>tabnext<cr>" "next tab"]
                                :N ["<cmd>tabnew<cr>" "New tab"]
                                :p ["<cmd>tabprevious<cr>" "previous tab"]
                                :o ["<cmd>tabonly<cr>" "close other tabs"] 
                                :m ["<cmd>tab sp<cr>" "open current buffer in new tab"]
                                :m ["<cmd>tab sp<cr>" "open current buffer in new tab"]}})

              (wk.register {:w {:name "windows"
                                :h ["<cmd>wincmd h<cr>" "window left"]
                                :j ["<cmd>wincmd j<cr>" "window down"]
                                :k ["<cmd>wincmd k<cr>" "window up"]
                                :l ["<cmd>wincmd l<cr>" "window right"]
                                :1 ["<cmd>1 wincmd w<cr>" "window 1"]
                                :2 ["<cmd>2 wincmd w<cr>" "window 2"]
                                :3 ["<cmd>3 wincmd w<cr>" "window 3"]
                                :o ["<cmd>only<cr>" "close other windows"]
                                :n ["<cmd>split<cr>" "split (horizontal)"]
                                :| ["<cmd>vsplit<cr>" "split (vertical)"]
                                :q ["<cmd>close<cr>" "close"]}
                            :prefix "<leader>"}))

            (set vim.o.timeoutlen 300))
    :opts {}})]

