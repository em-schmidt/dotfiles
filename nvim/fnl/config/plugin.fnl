(module config.plugin
  {autoload {nvim aniseed.nvim a aniseed.core
             util config.util
             packer packer}})

(defn- safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :config.plugin. name))]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name)))))))
  nil)

(use
  ;;;System

  ;;plugin manager
  :wbthomason/packer.nvim {}

  ;; nvim config and plugins in Fennel
  :Olical/aniseed {}

  ;;;; Menu system & Neovim control
  :folke/which-key.nvim {:mod :which-key}

  :rcarriga/nvim-notify {:mod :notify}

  ;;;; themes and icons
  ;; Development related icons
  :kyazdani42/nvim-web-devicons {:mod :web-devicons}

  ;; Startup screen
  :mhinz/vim-startify {:mod :startify}

  ;; Pretty list for all your troubles
  :folke/trouble.nvim {:mod :trouble}

  ;; Add missing colours for themes
  :folke/lsp-colors.nvim {:mod :lspcolors}

  ;; Hightlight TODOs - :TodoQuickFix
  :folke/todo-comments.nvim
  {:requires [:nvim-lua/plenary.nvim]
   :mod :todocomments}

  ;; MacOS auto-switch dark mode
  :f-person/auto-dark-mode.nvim {:mod :auto-dark-mode}

  ;; Newpaper - subtle light and dark themes
  :yorik1984/newpaper.nvim {:mod :theme-newpaper}

  ;; Gruvbox theme with treesitter support
  :luisiacc/gruvbox-baby {}

  ;; GitHub themes - dark and light variations configured in plugins/theme.fnl
  :projekt0n/github-nvim-theme {:mod :theme}

  ;; Omni dark theme for Neovim - https://github.com/getomni/neovim
  :getomni/neovim {}

  ;; One dark & light theme for Neovim - https://github.com/disrupted/one.nvim
  :disrupted/one.nvim {}

  ;;dark & light theme with wide plugin support
  :folke/tokyonight.nvim {}

  :overcache/NeoSolarized {}
  :ishan9299/nvim-solarized-lua {}

  ;;;; status line
  :nvim-lualine/lualine.nvim
    {:requires [:kyazdani42/nvim-web-devicons]
      :mod :theme-lualine}

  ;;  TODO: indent guides might be nice for yaml.
  ;;:lukas-reineke/indent-blankline.nvim
  ;;  {:mod :indent}

  ;;;; Navigation

  ;; project management
  :ahmedkhalf/project.nvim {:mod :project}
  :GnikDroy/projections.nvim {:mod :projections}

  ;; peek at a line number
  :nacro90/numb.nvim {:mod :numb}

  ;; Projects and file navigation
  :kyazdani42/nvim-tree.lua
  {:requires [:kyazdani42/nvim-web-devicons]
   :tag :nightly
   :mod :nvim-tree}

  :nvim-telescope/telescope.nvim
  {:requires [:nvim-lua/popup.nvim
              :nvim-lua/plenary.nvim
              :rcarriga/nvim-notify  ;; ports extension

              ;; Extensions
              :nvim-telescope/telescope-file-browser.nvim
              :LinArcX/telescope-env.nvim
              :LinArcX/telescope-ports.nvim
              :nvim-telescope/telescope-packer.nvim
              :nvim-telescope/telescope-project.nvim
              :TC72/telescope-tele-tabby.nvim
              :nvim-telescope/telescope-ui-select.nvim]
   :mod :telescope}

  ;; Documentation
  :nvim-orgmode/orgmode {:mod :orgmode}

  :epwalsh/obsidian.nvim {:mod :obsidian}

  ;;;; Version control
  ;; diff view
  :sindrets/diffview.nvim
  {:requires [:nvim-lua/plenary.nvim]
   :mod :diffview}

  :lewis6991/gitsigns.nvim
  {:tag :release
   :mod :gitsigns}

  ;; GitHub Issues and Pull Requests
  :pwntester/octo.nvim
  {:requires [:nvim-lua/plenary.nvim
              :nvim-telescope/telescope.nvim
              :kyazdani42/nvim-web-devicons]
   :mod :octo}

  ;; magit style
  :TimUntersberger/neogit
  {:requires [:nvim-lua/plenary.nvim
              :sindrets/diffview.nvim]
   :mod :neogit}

  ;; git blame virt text
  :braxtons12/blame_line.nvim
    {:mod :blame}

  ;; text alignment
  :junegunn/vim-easy-align {:mod :easy-align}

  ;; multicursor selector
  :mg979/vim-visual-multi {}

  ;; ----------------------
  ;; Markdown
  :ixru/nvim-markdown {}

  ;; ---------------------
  ;; hashicorp/terraform

  :hashivim/vim-terraform {}

  ;; base64 encode/decode
  :taybart/b64.nvim {}

  ;; ---------------------
  ;; LISP related features

  ;; repl tools
  :clojure-vim/clojure.vim {}
  :clojure-vim/vim-jack-in {}
  :Olical/conjure {:mod :conjure}

  ;; sexp and vim-style editing
  :guns/vim-sexp {:mod :sexp}
  :windwp/nvim-autopairs {:mod :autopairs}

  :tpope/vim-abolish {}
  ;; :tpope/vim-commentary {}
  :terrortylor/nvim-comment {:mod :nvim-comment}

  ;; formatting
  :bfontaine/zprint.vim {}

  ;; Database Client :DB
  :tpope/vim-dadbod {}

  :tpope/vim-dispatch {}
  :tpope/vim-fugitive {:mod :fugitive}
  :tpope/vim-repeat {}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-sleuth {}
  :tpope/vim-surround {}
  :tpope/vim-unimpaired {}

  ;; parsing system
  :nvim-treesitter/nvim-treesitter
  {:run ":TSUpdate"
   :mod :treesitter}

  ;; lsp
  :neovim/nvim-lspconfig {:requires [:williamboman/mason.nvim
                                     :williamboman/mason-lspconfig.nvim]
                          :mod :lspconfig}

  :SmiteshP/nvim-navic {:requires [:neovim/nvim-lspconfig]
                        :mod :nvim-navic}

  ; snippets
  :L3MON4D3/LuaSnip {:requires [:saadparwaiz1/cmp_luasnip]}

  ;; autocomplete
  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-cmdline
                                :hrsh7th/cmp-nvim-lsp
                                :hrsh7th/cmp-path
                                :onsails/lspkind.nvim
                                :PaterJason/cmp-conjure]
                     :mod :cmp}
  )

