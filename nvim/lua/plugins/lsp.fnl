(local u (require :util))

[(u.tx :neovim/nvim-lspconfig
   {:dependencies [:williamboman/mason.nvim
                   :williamboman/mason-lspconfig.nvim
                   :hrsh7th/cmp-nvim-lsp
                   :SmiteshP/nvim-navic]
    :config (fn []
              (let [cmp_nvim_lsp (require :cmp_nvim_lsp)
                    capabilites (cmp_nvim_lsp.default_capabilities (vim.lsp.protocol.make_client_capabilities))
                    handlers {"textDocument/publishDiagnostics"
                                (vim.lsp.with
                                 vim.lsp.diagnostic.on_publish_diagnostics
                                 {:severity_sort true
                                  :update_in_insert false
                                  :underline true
                                  :virtual_text true})
                              "textDocument/hover"
                                (vim.lsp.with
                                 vim.lsp.handlers.hover
                                 {:border "single"})
                              "textDocument/signatureHelp"
                                (vim.lsp.with
                                 vim.lsp.handlers.signature_help
                                 {:border "single"})}
                    mason (require :mason)
                    mason-lspconfig (require :mason-lspconfig)
                    navic (require :nvim-navic)
                    on_attach (fn [client bufnr]
                                (do
                                  (vim.api.nvim_buf_set_keymap bufnr :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
                                  (vim.api.nvim_buf_set_keymap bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" {:noremap true})
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>ld "<cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true})
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>" {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>ln "<cmd>lua vim.lsp.buf.rename()<CR>" {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>le "<cmd>lua vim.diagnostic.open_float()<CR>" {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lq "<cmd>lua vim.diagnostic.setloclist()<CR>" {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lf "<cmd>lua vim.lsp.buf.format()<CR>" {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lj "<cmd>lua vim.diagnostic.goto_next()<CR>" {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lk "<cmd>lua vim.diagnostic.goto_prev()<CR>" {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>la "<cmd>lua vim.lsp.buf.code_action()<CR>" {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :v :<leader>la "<cmd>lua vim.lsp.buf.range_code_action()<CR> " {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lw ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>" {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>li ":lua require('telescope.builtin').lsp_implementations()<cr>" {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lr ":lua require('telescope.builtin').lsp_references()<cr>" {:noremap true}) 
                                  (if client.server_capabilities.documentSymbolProvider
                                      (do (navic.attach client bufnr)))))
                    ls-configs (fn [server]
                                 (let [settings {:fennel_language_server {:fennel {:diagnostics {:globals [:vim]}}}
                                                 :terraformls {:experimentalFeatures {:prefillRequiredFields true}}}]
                                   {:capabilites capabilites
                                    :handlers handlers
                                    :on_attach on_attach
                                    :settings (. settings server)}))]
                (mason.setup)
                (mason-lspconfig.setup 
                  {:automatic_installation true
                   :ensure_installed [
                                      "tflint"
                                      "jsonls"
                                      "terraformls"
                                      "fennel_language_server"
                                      "clojure_lsp"]})
                (mason-lspconfig.setup_handlers 
                  {1 (fn [servername]
                      ((. (. (require :lspconfig) servername) :setup) (ls-configs servername)))})))})]

