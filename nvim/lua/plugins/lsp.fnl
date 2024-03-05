(local u (require :util))

[(u.tx :neovim/nvim-lspconfig
  {:dependencies [:williamboman/mason.nvim
                  :williamboman/mason-lspconfig.nvim
                  :hrsh7th/cmp-nvim-lsp
                  :SmiteshP/nvim-navic
                  :Afourcat/treesitter-terraform-doc.nvim]
    :config (fn []
              (let [cmp_nvim_lsp (require :cmp_nvim_lsp)
                    capabilities (cmp_nvim_lsp.default_capabilities (vim.lsp.protocol.make_client_capabilities))
                    mason (require :mason)
                    mason-lspconfig (require :mason-lspconfig)
                    navic (require :nvim-navic)
                    on_attach (fn [client bufnr]
                                (do
                                  (vim.api.nvim_buf_set_keymap bufnr :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true :desc "goto definition"})
                                  (vim.api.nvim_buf_set_keymap bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" {:noremap true :desc "hover"})
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>ld "<cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true :desc "goto declaration"})
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>" {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true :desc "signature help"}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>ln "<cmd>lua vim.lsp.buf.rename()<CR>" {:noremap true :desc "rename"}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>le "<cmd>lua vim.diagnostic.open_float()<CR>" {:noremap true :desc "diagnostic popup"}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lq "<cmd>lua vim.diagnostic.setloclist()<CR>" {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lf "<cmd>lua vim.lsp.buf.format()<CR>" {:noremap true :desc "format buffer"}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lj "<cmd>lua vim.diagnostic.goto_next()<CR>" {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lk "<cmd>lua vim.diagnostic.goto_prev()<CR>" {:noremap true}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>la "<cmd>lua vim.lsp.buf.code_action()<CR>" {:noremap true :desc "code actions"}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :v :<leader>la "<cmd>lua vim.lsp.buf.range_code_action()<CR> " {:noremap true :desc "code actions"}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lw ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>" {:noremap true :desc "workspace diagnostics (telescope)"}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>li ":lua require('telescope.builtin').lsp_implementations()<cr>" {:noremap true :desc "implementations (telescope)"}) 
                                  (vim.api.nvim_buf_set_keymap bufnr :n :<leader>lr ":lua require('telescope.builtin').lsp_references()<cr>" {:noremap true :desc "references (telescope)"}) 
                                  (if client.server_capabilities.documentSymbolProvider
                                      (do (navic.attach client bufnr)))))]
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
                  {1 
                   (fn [servername]
                     ((. (. (require :lspconfig) servername) :setup) 
                      {:capabilities capabilities
                       :on_attach on_attach}))
                   :fennel_language_server 
                   (fn []
                     ((. (. (require :lspconfig) :fennel_language_server) :setup) 
                      {:capabilities capabilities
                       :on_attach on_attach
                       :settings {:fennel {:diagnostics {:globals [:vim]}}}}))
                   :terraformls
                   (fn [] 
                     ((. (. (require :lspconfig) :terraformls ) :setup) 
                      {:capabilities capabilities
                       :init_options {:experimentalFeatures {:prefillRequiredFields true
                                                             :validateOnSave true}}
                       :on_attach (fn [client bufnr] 
                                    (on_attach client bufnr)
                                    ((. (require :treesitter-terraform-doc) :setup) {:command_name :OpenTerraformDoc})
                                    (vim.api.nvim_buf_set_keymap bufnr :n :<localleader>td "<cmd>OpenTerraformDoc<cr>" {:noremap true :desc "terraform documentation"}) 
                                    (vim.api.nvim_buf_set_keymap bufnr :n :<localleader>ta "<cmd>TermExec cmd='terraform apply'<cr>" {:noremap true :desc "terraform apply"}) 
                                    (vim.api.nvim_buf_set_keymap bufnr :n :<localleader>ti "<cmd>TermExec cmd='terraform init'<cr>" {:noremap true :desc "terraform init"}) 
                                    (vim.api.nvim_buf_set_keymap bufnr :n :<localleader>tp "<cmd>TermExec cmd='terraform plan'<cr>" {:noremap true :desc "terraform plan"}) 
                                    (vim.api.nvim_buf_set_keymap bufnr :n :<localleader>tv "<cmd>TermExec cmd='terraform validate'<cr>" {:noremap true :desc "terraform validate"}))}))})))})] 
