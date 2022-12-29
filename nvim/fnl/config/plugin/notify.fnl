(module config.plugin.notify
  {autoload {notify notify}})

(notify.setup {})

(set vim.notify notify)

