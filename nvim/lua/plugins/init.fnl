(local u (require :util))

[(u.tx :Olical/nfnl
  {:ft :fennel})

 (u.tx :rcarriga/nvim-notify
   {:config (fn []
              (let [notify (require :notify)]
                (set vim.notify notify)))})

 (u.tx :stevearc/dressing.nvim 
   {:event :VeryLazy})
 
 (u.tx :nvim-tree/nvim-web-devicons 
   {:lazy true})

 (u.tx :taybart/b64.nvim)

 (u.tx :terrortylor/nvim-comment 
   {:config (fn []
              ((. (require :nvim_comment) :setup) {}))})

 (u.tx :folke/todo-comments.nvim
   {:dependencies [:nvim-lua/plenary.nvim]
    :opts {}})

 (u.tx :akinsho/toggleterm.nvim
   {:opts {:winbar {:enabled true}}})

 (u.tx :ahmedkhalf/project.nvim
   {:config (fn []
              ((. (require :project_nvim) :setup) {}))})

 ;; 
 ;; lisp - repl
 ;;
 ;;(u.tx :clojure-vim/vim-jack-in)

 (u.tx :windwp/nvim-autopairs
   {:event "InsertEnter"
    :opts {}})
 
 (u.tx :nacro90/numb.nvim
   {:opts {:show_numbers true
           :show_cursorline true
           :numbers_only true
           :centered_peeking true}})

 (u.tx :folke/trouble.nvim
   {:opts {:auto_preview true
           :mode :document_diagnostics}})

 (u.tx :gpanders/nvim-parinfer)

 (u.tx :julienvincent/nvim-paredit
  {:config (fn []
            ((. (require :nvim-paredit) :setup) {}))})]

