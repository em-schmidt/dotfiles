;;
;; Default configuration for longway.nvim
;;

(local default-config
  {
   ;; Add your default configuration options here
   :enabled true
   :debug false
   })

(var config default-config)

(fn get []
  "Get the current configuration"
  config)

(fn set [opts]
  "Set configuration options by merging with defaults"
  (set config (vim.tbl_deep_extend :force default-config (or opts {}))))

(fn reset []
  "Reset configuration to defaults"
  (set config default-config))

{
 : get
 : set
 : reset
 : default-config}
