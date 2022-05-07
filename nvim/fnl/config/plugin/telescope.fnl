(module config.plugin.telescope
  {autoload {nvim aniseed.nvim
             util config.util}})

(def telescope (require :telescope))

(let [(ok? telescope) (pcall require :telescope)]
  (when ok?

    (telescope.setup {:pickers {:buffers {:show_all_buffers true
                                          :sort_lastused true
                                          :mappings {:n {:x :delete_buffer}}}}})

    (util.lnnoremap :b "Telescope buffers")
    (util.lnnoremap :p "Telescope commands")
    (util.lnnoremap :fb "Telescope buffers")
    (util.lnnoremap :ff "Telescope find_files")
    (util.lnnoremap :fm "Telescope keymaps")
    (util.lnnoremap :fp "Telescope commands")
    (util.lnnoremap :fq "Telescope quickfix")
    (util.lnnoremap :fl "Telescope loclist")
    (util.lnnoremap :fa "Telescope lsp_code_actions")
    (util.lnnoremap :fi "Telescope lsp_implementations")
    (util.lnnoremap :fr "Telescope lsp_references")
    (util.lnnoremap :fs "Telescope lsp_workspace_symbols")

    ))
