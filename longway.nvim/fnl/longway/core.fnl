;;
;; Core functionality for longway.nvim
;;

(local config (require :longway.config))

(fn hello []
  "Example function - prints a greeting"
  (let [cfg (config.get)]
    (vim.notify cfg.greeting vim.log.levels.INFO)))

(fn example-command []
  "Example command implementation"
  (print "Longway command executed!"))

(fn setup-commands []
  "Register plugin commands"
  (vim.api.nvim_create_user_command
    :LongwayHello
    hello
    {:desc "Say hello from longway"}))

(fn setup-keymaps []
  "Setup default keymaps if configured"
  ;; Add default keymaps here if needed
  nil)

{
 : hello
 : example-command
 : setup-commands
 : setup-keymaps}
