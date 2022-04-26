(module config.plugin.lspconfig
  {autoload {nvim aniseed.nvim
             util config.util}})

(defn- define-signs
  [prefix]
  (let [error (.. prefix "SignError")
        warn (.. prefix "SignWarn")
        info (.. prefix "SignWarn")
        hint (.. prefix "SignHint")]
    (vim.fn.sign_define error {:text "☠️" :texthl error})
    (vim.fn.sign_define warn {:text "⚠️" :texthl warn})
    (vim.fn.sign_define info {:text "ℹ️" :texthl info})
    (vim.fn.sign_define hint {:text "🧩" :texthl hint})))

(defn- map
  [from to]
  (util.nnoremap from to))

(defn- lsp_server_setup
  [server]
  (server:setup {}))

(let [(ok? lsp) (pcall require :lspconfig)]
  (when ok?

    (define-signs "Diagnostic")
    (define-signs "LspDiagnostics")

    (map :gd "lua vim.lsp.buf.definition()")
    (map :gD "lua vim.lsp.buf.declaration()")
    (map :gr "lua vim.lsp.buf.references()")
    (map :gi "lua vim.lsp.buf.implementation()")
    (map :K "lua vim.lsp.buf.hover()")

    (map :<c-n> "lua vim.lsp.diagnostic.goto_next()")
    (map :<c-p> "lua vim.lsp.diagnostic.goto_prev()")

    (map :<leader>lf "lua vim.lsp.buf.formatting()")

    (let [(ok? installer) (pcall require :nvim-lsp-installer)]
      (when ok?
        (installer.on_server_ready lsp_server_setup)))



    ))

