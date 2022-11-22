(module config.plugin.obsidian
  {autoload {obsidian obsidian}})

(obsidian.setup
  {
   :dir "~/workspace/spaceba.by/notes"
   :completion {:nvim_cmp true}
   :daily_notes {:folder "daily"}
   })

