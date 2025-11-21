;;
;; Main entry point for longway.nvim
;;

(local config (require :longway.config))
(local core (require :longway.core))

(var initialized? false)

(fn setup [opts]
  "Setup function called by users to initialize the plugin"
  (when initialized?
    (vim.notify "longway.nvim already initialized" vim.log.levels.WARN)
    (lua "return"))
  
  ;; Merge user config with defaults
  (config.set opts)
  
  ;; Setup commands
  (core.setup-commands)
  
  ;; Setup keymaps
  (core.setup-keymaps)
  
  (set initialized? true)
  
  (let [cfg (config.get)]
    (when cfg.debug
      (vim.notify "longway.nvim initialized" vim.log.levels.INFO))))

{
 : setup
 : config
 : core}
