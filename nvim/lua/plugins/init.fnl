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
        :terminal {:enabled true}
        :gitbrowse {:enabled true}}
    :keys
      [(u.tx :<leader>bb (fn [] (Snacks.picker.buffers)) {:desc "buffers"})
       (u.tx :<leader>fe (fn [] (Snacks.picker.explorer)) {:desc "explorer"})
       (u.tx :<leader>ff (fn [] (Snacks.picker.files)) {:desc "files"})
       (u.tx :<leader>fs (fn [] (Snacks.picker.smart)) {:desc "explorer"})
       (u.tx :<leader>ft (fn [] (Snacks.picker.explorer)) {:desc "explorer"})
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

 {:dir "~/workspace/longway.nvim"
  :dependencies [:nvim-lua/plenary.nvim]
  :opts {:token_file (vim.fn.expand "~/.config/longway.nvim/token") 
         :workspace_dir (vim.fn.expand "~/workspace/spaceba.by/notes/work/crossbeam/shortcut")
         :auto_push_on_save  true
         :pull_on_open true
         :conflict_strategy :prompt
         :presets 
            {
             :my_work 
               {:query "owner:eschmidt"
                :description "my stories"}}
         :default_preset :my_work
         :debug false}
  :keys
    [(u.tx :<leader>pc "<cmd>LongwayPicker comments<cr>" {:desc "shortcut comments"})
     (u.tx :<leader>pe "<cmd>LongwayPicker epics<cr>" {:desc "shortcut epics"})
     (u.tx :<leader>pm "<cmd>LongwayPicker modified<cr>" {:desc "shortcut modified"})
     (u.tx :<leader>pP "<cmd>LongwayPicker presets<cr>" {:desc "shortcut presets"})
     (u.tx :<leader>pS "<cmd>LongwayStatus<cr>" {:desc "shortcut Status"})
     (u.tx :<leader>ps "<cmd>LongwayPicker stories<cr>" {:desc "shortcut stories"})]}

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

