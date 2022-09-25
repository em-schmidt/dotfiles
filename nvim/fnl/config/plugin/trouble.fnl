(module config.plugin.trouble
  {autoload {trouble trouble
             util config.util}})

;; https://github.com/folke/trouble.nvim

(trouble.setup
 {:auto_preview false}) ;; fixes error on TroubleToggle

(util.lnnoremap :et "TroubleToggle")

