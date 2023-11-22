(local u (require :util))

(fn create_keymaps
  []
  "apply the keymaps"

  ;; tabs
  (u.lnnoremap :tt "Telescope tele_tabby list" "list tabs")
  (u.lnnoremap :td "tabclose" "close current tab")
  (u.lnnoremap :tn "tabnext" "next tab")
  (u.lnnoremap :tN "tabnew" "New tab")
  (u.lnnoremap :tp "tabprevious" "previous tab")
  (u.lnnoremap :to "tabonly" "close other tab") 
  (u.lnnoremap :tm "tab sp" "open current buffer in new tab")

  ;;terminal
  (u.lnnoremap :. "ToggleTerm" "toggle terminal")
  (vim.keymap.set :t :<esc><esc> "<c-\\><c-n>" {:noremap true})


  ;; windows - movement
  (u.lnnoremap :wh "wincmd h" "window left")
  (u.lnnoremap :wj "wincmd j" "window down")
  (u.lnnoremap :wk "wincmd k" "window up")
  (u.lnnoremap :wl "wincmd l" "window right")
  (u.lnnoremap :w1 "1 wincmd w" "window 1")
  (u.lnnoremap :w2 "2 wincmd w" "window 2")
  (u.lnnoremap :w3 "3 wincmd w" "window 3")
  (u.lnnoremap :w4 "4 wincmd w" "window 4")
  (u.lnnoremap :w5 "5 wincmd w" "window 5")
  (u.lnnoremap :w6 "6 wincmd w" "window 6")

  ;; windows - splits
  (u.lnnoremap :wm "only" "close other windows")
  (u.lnnoremap :wn "split" "split current window (horizontal)")
  (u.lnnoremap :w| "vsplit" "split current window (vertical)")
  (u.lnnoremap :wq "close" "close current window")

  ;; buffers
  (u.lnnoremap :<tab> "b#" "next buffer")
  (u.lnnoremap :ba "ball" "open all buffers")
  (u.lnnoremap :bb "Telescope buffers" "list buffers")
  (u.lnnoremap :bd "bdelete" "delete current buffer")
  (u.lnnoremap :bn "bnext" "next buffer")
  (u.lnnoremap :bp "bprevious" "previous buffer")

  ;; projects and files
  (u.lnnoremap :f/ "Telescope live_grep" "grep in workspace")
  (u.lnnoremap :fb "Telescope file_browser" "browse project")
  (u.lnnoremap :ff "Telescope find_files" "project files")
  (u.lnnoremap :fs "write")
  (u.lnnoremap :ft "NvimTreeToggle" "toggle file tree")
  (u.lnnoremap :pt "TodoTelescope" "project todos")
  (u.lnnoremap :pp "lua require'telescope'.extensions.project.project{ display_type = 'full' }" "projects")


  ;; packages and such
  (u.lnnoremap :Pl "Lazy" "open plugin manager (lazy.nvim)")

  ;; git stuff
  (u.lnnoremap :gb "Gitsigns toggle_current_line_blame" "toggle git blame")
  (u.lnnoremap :gs "Telescope git_status" "git status")
  (u.lnnoremap :gl "Telescope git_commits" "git log")

  ;; misc 
  (u.lnnoremap :et "TroubleToggle" "toggle error view"))

{: create_keymaps}
