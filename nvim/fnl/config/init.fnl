(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string}})

;; inspired by https://github.com/Olical/dotfiles
;;    and https://github.com/practicalli/neovim-config-redux/

(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;; tabs
(util.lnnoremap :tt "Telescope tele_tabby list")
(util.lnnoremap :td "tabclose")
(util.lnnoremap :tn "tabnext")
(util.lnnoremap :tp "tabprevious")
(util.lnnoremap :to "tabonly") ;; Only show actie tab
(util.lnnoremap :tm "tab sp") ;; Creates a new split as a tab

;; windows - movement
(util.lnnoremap :wh "wincmd h")
(util.lnnoremap :wj "wincmd j")
(util.lnnoremap :wk "wincmd k")
(util.lnnoremap :wl "wincmd l")

;; windows - splits
(util.lnnoremap :wm "only")
(util.lnnoremap :wn "split")
(util.lnnoremap :ws "split")
(util.lnnoremap :wv "vsplit")
(util.lnnoremap :w| "vsplit")
(util.lnnoremap :wq "close")

;; buffers
(util.lnnoremap :<tab> "b#")
(util.lnnoremap :ba "ball")
(util.lnnoremap :bb "Telescope buffers")
(util.lnnoremap :bd "bdelete")
(util.lnnoremap :bn "bnext")
(util.lnnoremap :bp "bprevious")

;; projects and files
(util.lnnoremap :f/ "Telescope live_grep")
(util.lnnoremap :fb "Telescope file_browser")
(util.lnnoremap :ff "Telescope find_files")
(util.lnnoremap :fp "Telescope find_files")
(util.lnnoremap :fs "write")
(util.lnnoremap :fe "NvimTreeToggle")
(util.lnnoremap :pt "TodoTelescope")

;; Help and documentation
(util.lnnoremap :hh "Telescope help_tags")

;; Colors and themes
(util.lnnoremap :cs "Telescope colorscheme")

;; Package Manager
;; list packages
(util.lnnoremap :Pl "Telescope packer")
(util.lnnoremap :Pi "PackerInstall")
(util.lnnoremap :Ps "PackerSync")
(util.lnnoremap :Pu "PackerUpdate")
(util.lnnoremap :Ptu "TSUpdate")
(util.lnnoremap :Pti "TSInstallInfo")

;; Treesitter parsers update
(util.lnnoremap :Ptu "TSUpdate")
;; Treesitter parsers install status
(util.lnnoremap :Pti "TSInstallInfo")

;; Quit
(util.lnnoremap :qa "quitall")
(util.lnnoremap :qq "quit")
(util.lnnoremap :qQ "quit!")

;; Git Version control
(util.lnnoremap :gd "DiffviewOpen")
(util.lnnoremap :gs "Neogit")

;; Clojure Reader macro
;; (util.lnnoremap :cc "(i#_<ESC>")
;; (util.lnnoremap :cu "<Cmd>let s=@/<CR>l?\\v(#_)+<CR>dgn:let @/=s<CR>")

;; escape from terminal normal mode
(nvim.set_keymap :t :<esc><esc> "<c-\\><c-n>" {:noremap true})

;; --------------------
;; Filetype configuration

;; Set Conjure and other filetype line comments to ;;
(vim.api.nvim_create_autocmd
  :FileType
  {:group    (vim.api.nvim_create_augroup :commentary_config {:clear true})
   :pattern  [:lisp :clojure :racket :fennel]
   :callback (fn [] (set vim.opt_local.commentstring ";; %s") nil)})

;; set filetypes filename extensions for Clojure
;; autocmd BufNewFile,BufRead .edn,clj,.cljstyle set filetype=clojure
(nvim.ex.autocmd "BufNewFile,BufRead" ".edn,.clj,.cljstyle" "set filetype=clojure")

;; clear symbol highlighting on enter in normal mode
(util.nnoremap :<CR> "noh<CR><CR>")

(nvim.ex.autocmd "FocusGained,BufEnter" "*" ":checktime")

(nvim.ex.set :nowrap)

(let [options
      {
       :encoding "utf-8"
       :spelllang "en_us"
       :relativenumber true
       :number true
       :ruler true
       :completeopt "menuone,noselect"
       :wildmenu true
       :wildignore "*/tmp/*,*.so,*.swp,*.zip"
       :ignorecase true
       :smartcase true
       :clipboard "unnamedplus"
       :list false
       :listchars (str.join "," ["tab:▶-" "trail:•" "extends:»" "precedes:«"])
       :expandtab true
       :splitbelow true
       :splitright true
       :hlsearch true
       :signcolumn "number"
       }]
  (each [option value (pairs options)]
    (util.set-global-option option value)))

(require :config.core)
(require :config.plugin)

