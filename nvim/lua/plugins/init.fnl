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
      {:gitbrowse {:enabled true}
       :input {:enabled true}
       :image {:enabled true}
       :notifier {:enabled true}
       :picker {:enabled true}
       :explorer {}}
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
   {:opts {:auto_preview true
           :mode :document_diagnostics}})

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
  {:config (fn []
            ((. (require :nvim-paredit) :setup) {}))})]

