(module config.plugin.auto-dark-mode
  {autoload {adm auto-dark-mode
             util config.util}})

;; https://github.com/f-person/auto-dark-mode.nvim

(defn- set-light-mode
  []
  (vim.api.nvim_set_option :background "light")
  (vim.cmd "colorscheme github_light"))

(defn- set-dark-mode
  []
  (vim.api.nvim_set_option :background "dark")
  (vim.cmd "colorscheme NeoSolarized"))

(adm.setup
 {:update_interval 1000
  :set_dark_mode set-dark-mode
  :set_light_mode set-light-mode})
(adm.init)
