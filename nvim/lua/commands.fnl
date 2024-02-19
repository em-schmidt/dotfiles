
(fn register_commands []
  (vim.api.nvim_create_autocmd :BufWritePre
                               {
                                :pattern ["*.tf" "*.tfvars"]
                                :callback (fn [] (vim.lsp.buf.format))}))

{: register_commands}

