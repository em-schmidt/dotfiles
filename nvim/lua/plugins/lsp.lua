-- [nfnl] Compiled from lua/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local u = require("util")
local function _1_()
  return require("symbol-usage").setup({references = {enabled = true}})
end
local function _2_()
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local navic = require("nvim-navic")
  local on_attach
  local function _3_(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", {noremap = true, desc = "goto definition"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {noremap = true, desc = "hover"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ld", "<cmd>lua vim.lsp.buf.declaration()<cr>", {noremap = true, desc = "goto declaration"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {noremap = true, desc = "signature help"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<cr>", {noremap = true, desc = "rename"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<cr>", {noremap = true, desc = "diagnostic popup"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", {noremap = true, desc = "format buffer"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", {noremap = true, desc = "code actions"})
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>la", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", {noremap = true, desc = "code actions"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lw", "<cmd>Trouble diagnostics<cr>", {noremap = true, desc = "workspace diagnostics (trouble)"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>li", "<cmd>Telescope lsp_implementations<cr>", {noremap = true, desc = "implementations (telescope)"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", {noremap = true, desc = "references (telescope)"})
    if client.server_capabilities.documentSymbolProvider then
      return navic.attach(client, bufnr)
    else
      return nil
    end
  end
  on_attach = _3_
  mason.setup()
  mason_lspconfig.setup({automatic_installation = true, ensure_installed = {"tflint", "jsonls", "terraformls", "fennel_language_server", "clojure_lsp"}})
  local function _5_(servername)
    return require("lspconfig")[servername].setup({capabilities = capabilities, on_attach = on_attach})
  end
  local function _6_()
    return require("lspconfig").fennel_language_server.setup({capabilities = capabilities, on_attach = on_attach, settings = {fennel = {diagnostics = {globals = {"vim"}}}}})
  end
  local function _7_()
    local function _8_(client, bufnr)
      on_attach(client, bufnr)
      require("treesitter-terraform-doc").setup({command_name = "OpenTerraformDoc"})
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>td", "<cmd>OpenTerraformDoc<cr>", {noremap = true, desc = "terraform documentation"})
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>ta", "<cmd>TermExec cmd='terraform apply'<cr>", {noremap = true, desc = "terraform apply"})
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>ti", "<cmd>TermExec cmd='terraform init'<cr>", {noremap = true, desc = "terraform init"})
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>tp", "<cmd>TermExec cmd='terraform plan'<cr>", {noremap = true, desc = "terraform plan"})
      return vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>tv", "<cmd>TermExec cmd='terraform validate'<cr>", {noremap = true, desc = "terraform validate"})
    end
    return require("lspconfig").terraformls.setup({capabilities = capabilities, init_options = {experimentalFeatures = {prefillRequiredFields = true, validateOnSave = true}}, on_attach = _8_})
  end
  mason_lspconfig.setup_handlers({_5_, fennel_language_server = _6_, terraformls = _7_})
  return {codelens = {enabled = true}, inlay_hints = {enabled = true}}
end
return {u.tx("Wansmer/symbol-usage.nvim", {event = "LspAttach", config = _1_}), u.tx("neovim/nvim-lspconfig", {dependencies = {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp", "SmiteshP/nvim-navic", "Afourcat/treesitter-terraform-doc.nvim"}, config = _2_})}
