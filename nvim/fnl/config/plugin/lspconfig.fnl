(module config.plugin.lspconfig
  {autoload {nvim aniseed.nvim
             mason mason
             lspconfig lspconfig
             mason-lspconfig mason-lspconfig
             cmplsp cmp_nvim_lsp
             util config.util}})

(defn- define-signs
  [prefix]
  (let [error (.. prefix "SignError")
        warn (.. prefix "SignWarn")
        info (.. prefix "SignWarn")
        hint (.. prefix "SignHint")]
    (vim.fn.sign_define error {:text "☠️" :texthl error})
    ;;(vim.fn.sign_define error {:text "" :texthl error})
    (vim.fn.sign_define warn {:text "⚠️" :texthl warn})
    ;;(vim.fn.sign_define warn  {:text "" :texthl warn})
    (vim.fn.sign_define info {:text "ℹ️" :texthl info})
    ;;(vim.fn.sign_define info  {:text "" :texthl info})
    (vim.fn.sign_define hint {:text "🧩" :texthl hint})))
    ;;(vim.fn.sign_define hint  {:text "" :texthl hint})))

(defn- map
  [from to]
  (util.nnoremap from to))

(defn- lsp_server_setup
  [server]
  (server:setup {}))

(if (= (nvim.fn.has "nvim-0.6") 1)
    (define-signs "Diagnostic")
    (define-signs "LspDiagnostics"))

;; Configure server features
(let [handlers {"textDocument/publishDiagnostics"
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
      capabilities (cmplsp.default_capabilities (vim.lsp.protocol.make_client_capabilities))
      on_attach (fn [client bufnr]
                  (do
                    (nvim.buf_set_keymap bufnr :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>ld "<Cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>ln "<cmd>lua vim.lsp.buf.rename()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>le "<cmd>lua vim.diagnostic.open_float()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lq "<cmd>lua vim.diagnostic.setloclist()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lf "<cmd>lua vim.lsp.buf.format()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lj "<cmd>lua vim.diagnostic.goto_next()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lk "<cmd>lua vim.diagnostic.goto_prev()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>la "<cmd>lua vim.lsp.buf.code_action()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :v :<leader>la "<cmd>lua vim.lsp.buf.range_code_action()<CR> " {:noremap true})
                    ;telescope
                    (nvim.buf_set_keymap bufnr :n :<leader>lw ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lr ":lua require('telescope.builtin').lsp_references()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>li ":lua require('telescope.builtin').lsp_implementations()<cr>" {:noremap true})))]

  (mason.setup)
  (mason-lspconfig.setup
    {:automatic_installation true
     :ensure_installed [
                        "tflint"
                        "jsonls"
                        "terraformls"
                        "clojure_lsp"
                        ]})

  ;; Clojure LSP Server setup
  (lspconfig.clojure_lsp.setup
    {:on_attach on_attach
     :handlers handlers
     :capabilities capabilities})

  (lspconfig.jsonls.setup
    {:on_attach on_attach
     :handlers handlers
     :capabilities capabilities})

  (lspconfig.terraformls.setup
    {:on_attach on_attach
     :handlers handlers
     :capabilities capabilities
     :init_options {:experimentalFeatures {:prefillRequiredFields true}}})

  (lspconfig.tflint.setup
    {:on_attach on_attach
     :handlers handlers
     :capabilities capabilities})

  (lspconfig.yamlls.setup
    {:on_attach on_attach
     :handlers handlers
     :capabilities capabilities
     :settings
     { :yaml
      {:schemaStore { :enable :true
                      :url    "https://www.schemastore.org/api/json/catalog.json" }
        }}})
  )

(comment
  (def servername "clojure_lsp")
  (lspconfig.servername.setup {:on_attach on_attach})

    (mason-lspconfig.get_installed_servers)
    (mason-lspconfig.get_available_servers)
    (map :gd "lua vim.lsp.buf.definition()")
    (map :gD "lua vim.lsp.buf.declaration()")
    (map :gr "lua vim.lsp.buf.references()")
    (map :gi "lua vim.lsp.buf.implementation()")
    (map :K "lua vim.lsp.buf.hover()")

    (map :<c-n> "lua vim.lsp.diagnostic.goto_next()")
    (map :<c-p> "lua vim.lsp.diagnostic.goto_prev()")

    (map :<leader>lf "lua vim.lsp.buf.formatting()")
)

