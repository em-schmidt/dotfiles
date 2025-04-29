(local u (require :util))

[(u.tx :Olical/nfnl
  {:ft :fennel})

 (u.tx :taybart/b64.nvim)

 (u.tx :folke/todo-comments.nvim
   {:dependencies [:nvim-lua/plenary.nvim]
    :opts {}})

 (u.tx :folke/snacks.nvim
   {:priority 1000
    :lazy false
    :opts
        ;; TODO: add note management section, today's note, yesterday's note, recent notes
       {:dashboard {:sections [{:icon " "
                                :title "Keymaps"
                                :section "keys"
                                :indent 2
                                :padding 1}
                               {:icon " "
                                :title "Recent Files"
                                :section "recent_files"
                                :indent 2
                                :padding 1}
                               {:icon " "
                                :title "Projects"
                                :section "projects"
                                :indent 2
                                :padding 1}
                               {:section "startup"}]}
        :explorer {}
        :image {:enabled true}
        :input {:enabled true}
        :notifier {:enabled true}
        :picker {:enabled true}
        :statuscolumn {}
        :gitbrowse {:enabled true}}
    :keys
      [(u.tx :<leader>bb (fn [] (Snacks.picker.buffers)) {:desc "buffers"})
       (u.tx :<leader>fe (fn [] (Snacks.picker.explorer)) {:desc "explorer"})
       (u.tx :<leader>ft (fn [] (Snacks.picker.explorer)) {:desc "explorer"})
       (u.tx :<leader>ff (fn [] (Snacks.picker.smart)) {:desc "files"})
       (u.tx :<leader>f/ (fn [] (Snacks.picker.grep)) {:desc "grep"})
       (u.tx :<leader>gB (fn [] (Snacks.gitbrowse)) {:desc "open git in browser"})
       (u.tx :<leader>gl (fn [] (Snacks.picker.git_log)) {:desc "git log"})
       (u.tx :<leader>gs (fn [] (Snacks.picker.git_status)) {:desc "git status"})
       (u.tx :<leader>Nh (fn [] (Snacks.picker.notifications)) {:desc "notificaiton history"})
       (u.tx :<leader>Nd (fn [] (Snacks.notifier.hide)) {:desc "dismiss notifications"})
       (u.tx :<leader>pp (fn [] (Snacks.picker.projects)) {:desc "projects"})
       (u.tx :<leader>pt (fn [] (Snacks.picker.todo_comments)) {:desc "TODOs"})]})

 (u.tx :folke/trouble.nvim
   {:opts {}})

 (u.tx :akinsho/toggleterm.nvim
   {:opts {}})

 (u.tx :ahmedkhalf/project.nvim
   {:config (fn []
              ((. (require :project_nvim) :setup) {}))})

 (u.tx :windwp/nvim-autopairs
   {:event "InsertEnter"
    :opts {}})
 
 (u.tx :nacro90/numb.nvim
   {:opts {:show_numbers true
           :show_cursorline true
           :numbers_only true
           :centered_peeking true}})

 (u.tx :gpanders/nvim-parinfer)

 (u.tx :julienvincent/nvim-paredit
   {:opts {}})]

