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
(util.lnnoremap :tt "Telescope tele_tabby list" "list tabs")
(util.lnnoremap :td "tabclose" "close current tab")
(util.lnnoremap :tn "tabnext" "next tab")
(util.lnnoremap :tN "tabnew" "New tab")
(util.lnnoremap :tp "tabprevious" "previous tab")
(util.lnnoremap :to "tabonly" "close other tab") 
(util.lnnoremap :tm "tab sp" "open current buffer in new tab")

;; windows - movement
(util.lnnoremap :wh "wincmd h" "window left")
(util.lnnoremap :wj "wincmd j" "window down")
(util.lnnoremap :wk "wincmd k" "widow up")
(util.lnnoremap :wl "wincmd l" "window right")
(util.lnnoremap :w1 "1 wincmd w" "window 1")
(util.lnnoremap :w2 "2 wincmd w" "window 2")
(util.lnnoremap :w3 "3 wincmd w" "window 3")
(util.lnnoremap :w4 "4 wincmd w" "window 4")
(util.lnnoremap :w5 "5 wincmd w" "window 5")
(util.lnnoremap :w6 "6 wincmd w" "window 6")

;; windows - splits
(util.lnnoremap :wm "only" "close other windows")
(util.lnnoremap :wn "split" "split current window (down)")
(util.lnnoremap :ws "split" "split current window (down)")
(util.lnnoremap :wv "vsplit" "split current window (right)")
(util.lnnoremap :w| "vsplit" "split current window (right)")
(util.lnnoremap :wq "close" "close current window")

;; buffers
(util.lnnoremap :<tab> "b#" 
                "next buffer")
(util.lnnoremap :ba "ball" "open all buffers")
(util.lnnoremap :bb "Telescope buffers" "list buffers")
(util.lnnoremap :bd "bdelete" "delete current buffer")
(util.lnnoremap :bn "bnext" "next buffer")
(util.lnnoremap :bp "bprevious" "previous buffer")

;; projects and files
(util.lnnoremap :f/ "Telescope live_grep" "grep in workspace")
(util.lnnoremap :fb "Telescope file_browser" "browse project")
(util.lnnoremap :ff "Telescope find_files" "project files")
(util.lnnoremap :fs "write")
(util.lnnoremap :fe "NvimTreeToggle" "toggle file tree")
(util.lnnoremap :pt "TodoTelescope" "project todos")

;; Help and documentation
(util.lnnoremap :hh "Telescope help_tags" "vim help")

;; Colors and themes
(util.lnnoremap :cs "Telescope colorscheme" "select colorscheme")

;; Package Manager
;; list packages
(util.lnnoremap :Pl "Telescope packer" "show installed pacakges")
(util.lnnoremap :Pi "PackerInstall" "install packages")
(util.lnnoremap :Ps "PackerSync" "sync packages")
(util.lnnoremap :Pu "PackerUpdate" "update packages")
(util.lnnoremap :Ptu "TSUpdate" "update tree sitter parsers")
(util.lnnoremap :Pti "TSInstallInfo" "show tree sitter info")

;; toggles
(util.lnnoremap :oe "TroubleToggle" "toggle error window")
(util.lnnoremap :of "NvimTreeToggle" "toggle file tree")

;; Quit
(util.lnnoremap :qa "quitall" "quit all")
(util.lnnoremap :qq "quit" "quit")
(util.lnnoremap :qQ "quit!" "force quit")

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

;; override shitwidth for some file types.
(nvim.ex.autocmd "BufNewFile,BufRead" "*.html,*.js,*.json,*.tf,*.tfvars,*.vue,*.scss,*.css" "setlocal shiftwidth=2")

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
       :fillchars "vert:┃"
       :listchars (str.join "," ["tab:▶-" "trail:•" "extends:»" "precedes:«"])
       :expandtab true
       :shiftwidth 2
       :tabstop 2
       :splitbelow true
       :splitright true
       :hlsearch true
       :signcolumn "number"
       }]
  (each [option value (pairs options)]
    (util.set-global-option option value)))

(vim.cmd "highlight VertSplit guifg=fg")

(require :config.core)
(require :config.plugin)

