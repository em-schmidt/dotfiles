-- [nfnl] Compiled from lua/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local u = require("util")
local function _1_()
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local navic = require("nvim-navic")
  local on_attach
  local function _2_(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, desc = "goto definition"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, desc = "hover"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ld", "<cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true, desc = "goto declaration"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, desc = "signature help"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, desc = "rename"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>", {noremap = true, desc = "diagnostic popup"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", {noremap = true, desc = "format buffer"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true, desc = "code actions"})
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>la", "<cmd>lua vim.lsp.buf.range_code_action()<CR> ", {noremap = true, desc = "code actions"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lw", ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", {noremap = true, desc = "workspace diagnostics (telescope)"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>li", ":lua require('telescope.builtin').lsp_implementations()<cr>", {noremap = true, desc = "implementations (telescope)"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", ":lua require('telescope.builtin').lsp_references()<cr>", {noremap = true, desc = "references (telescope)"})
    if client.server_capabilities.documentSymbolProvider then
      return navic.attach(client, bufnr)
    else
      return nil
    end
  end
  on_attach = _2_
  mason.setup()
  mason_lspconfig.setup({automatic_installation = true, ensure_installed = {"tflint", "jsonls", "terraformls", "fennel_language_server", "clojure_lsp"}})
  local function _4_(servername)
    return ((require("lspconfig"))[servername]).setup({capabilities = capabilities, on_attach = on_attach})
  end
  local function _5_()
    return ((require("lspconfig")).fennel_language_server).setup({capabilities = capabilities, on_attach = on_attach, settings = {fennel = {diagnostics = {globals = {"vim"}}}}})
  end
  local function _6_()
    local function _7_(client, bufnr)
      on_attach(client, bufnr)
      do end (require("treesitter-terraform-doc")).setup({command_name = "OpenTerraformDoc"})
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>td", "<cmd>OpenTerraformDoc<cr>", {noremap = true, desc = "terraform documentation"})
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>ta", "<cmd>TermExec cmd='terraform apply'<cr>", {noremap = true, desc = "terraform apply"})
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>tp", "<cmd>TermExec cmd='terraform plan'<cr>", {noremap = true, desc = "terraform plan"})
      return vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>tv", "<cmd>TermExec cmd='terraform validate'<cr>", {noremap = true, desc = "terraform validate"})
    end
    return ((require("lspconfig")).terraformls).setup({capabilities = capabilities, settings = {terraform = {experimentalFeatures = {preFillRequiredFields = true, validateOnSave = true}}}, on_attach = _7_})
  end
  return mason_lspconfig.setup_handlers({_4_, fennel_language_server = _5_, terraformls = _6_})
end
return {u.tx("neovim/nvim-lspconfig", {dependencies = {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp", "SmiteshP/nvim-navic", "Afourcat/treesitter-terraform-doc.nvim"}, config = _1_})}
