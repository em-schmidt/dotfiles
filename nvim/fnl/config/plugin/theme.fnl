(module config.plugin.theme
  {autoload {theme github-theme}})

(theme.setup {:options {:styles {:comments "italic"}}})

(vim.cmd "colorscheme github_light_high_contrast")
