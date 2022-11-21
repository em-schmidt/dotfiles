(module config.plugin.projections
  {autoload {nvim aniseed.nvim
             projections projections
             session projections.session
             telescope telescope
             util config.util}})

(projections.setup
  {
   :workspaces ["~/workspace/crossbeam"
                "~/workspace/spaceba.by"
                "~/workspace"]
   :patterns [".git"]
   })

(telescope.load_extension "projections")
(util.lnnoremap :fp "Telescope projections")


(nvim.create_user_command :StoreProjectSession (fn [] (session.store (vim.loop.cwd))) {})
(nvim.create_user_command :RestoreProjectSession (fn [] (session.restore (vim.loop.cwd))) {})

(nvim.ex.autocmd "DirChangedPre,VimLeavePre" "*" "StoreProjectSession")
