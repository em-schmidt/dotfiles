-- [nfnl] lua/plugins/lsp.fnl
local u = require("util")
local function _1_()
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local diagnostics = {float = {border = "rounded", focusable = true, source = "always", style = "minimal"}, jump = {wrap = true, float = false}, severity_sort = true, signs = {linehl = {[vim.diagnostic.severity.ERROR] = "ErrorMsg", [vim.diagnostic.severity.WARN] = "WarningMsg", [vim.diagnostic.severity.HINT] = "HintMsg", [vim.diagnostic.severity.INFO] = "InfoMsg"}, numhl = {[vim.diagnostic.severity.ERROR] = "ErrorMsg", [vim.diagnostic.severity.WARN] = "WarningMsg", [vim.diagnostic.severity.HINT] = "HintMsg", [vim.diagnostic.severity.INFO] = "InfoMsg"}, text = {[vim.diagnostic.severity.ERROR] = "\239\129\151 ", [vim.diagnostic.severity.WARN] = "\239\129\177 ", [vim.diagnostic.severity.HINT] = "\239\131\171 ", [vim.diagnostic.severity.INFO] = "\239\129\154 "}}, underline = true, virtual_lines = true, update_in_insert = false}
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local navic = require("nvim-navic")
  local on_attach
  local function _2_(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", {noremap = true, desc = "goto definition"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {noremap = true, desc = "hover"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", {noremap = true, desc = "code actions"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ld", "<cmd>lua vim.lsp.buf.declaration()<cr>", {noremap = true, desc = "goto declaration"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<cr>", {noremap = true, desc = "diagnostic popup"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", {noremap = true, desc = "format buffer"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {noremap = true, desc = "signature help"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>li", "<cmd>lua Snacks.picker.lsp_implementations()<cr>", {noremap = true, desc = "implementations"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", {noremap = true, desc = "next diagnostic"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", {noremap = true, desc = "previous diagnostic"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<cr>", {noremap = true, desc = "rename"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", {noremap = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", "<cmd>lua Snacks.picker.lsp_references()<cr>", {noremap = true, desc = "references"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", {noremap = true, desc = "type definition"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lw", "<cmd>Trouble workspace_diagnostics<cr>", {noremap = true, desc = "workspace diagnostics (trouble)"})
    local function _3_()
      if vim.diagnostic.is_enabled() then
        return vim.diagnostic.disable()
      else
        return vim.diagnostic.enable()
      end
    end
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lT", "", {noremap = true, desc = "toggle diagnostics", callback = _3_})
    vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>la", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", {noremap = true, desc = "code actions"})
    if client.server_capabilities.documentSymbolProvider then
      return navic.attach(client, bufnr)
    else
      return nil
    end
  end
  on_attach = _2_
  mason.setup()
  mason_lspconfig.setup({automatic_installation = true, ensure_installed = {"tflint", "jsonls", "terraformls", "fennel_language_server", "clojure_lsp"}})
  vim.diagnostic.config(diagnostics)
  vim.lsp.config("*", {capabilities = capabilities, on_attach = on_attach})
  vim.lsp.config("fennel_language_server", {capabilities = capabilities, on_attach = on_attach, single_file_support = true, settings = {fennel = {diagnostics = {globals = {"vim", "Snacks"}}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}})
  local function _6_(client, bufnr)
    on_attach(client, bufnr)
    require("treesitter-terraform-doc").setup({command_name = "OpenTerraformDoc"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>td", "<cmd>OpenTerraformDoc<cr>", {noremap = true, desc = "terraform documentation"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>ta", "<cmd>TermExec cmd='terraform apply'<cr>", {noremap = true, desc = "terraform apply"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>ti", "<cmd>TermExec cmd='terraform init'<cr>", {noremap = true, desc = "terraform init"})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>tp", "<cmd>TermExec cmd='terraform plan'<cr>", {noremap = true, desc = "terraform plan"})
    return vim.api.nvim_buf_set_keymap(bufnr, "n", "<localleader>tv", "<cmd>TermExec cmd='terraform validate'<cr>", {noremap = true, desc = "terraform validate"})
  end
  return vim.lsp.config("terraformls", {capabilities = capabilities, init_options = {experimentalFeatures = {prefillRequiredFields = true, validateOnSave = true}}, on_attach = _6_})
end
return {u.tx("neovim/nvim-lspconfig", {dependencies = {"mason-org/mason.nvim", "mason-org/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp", "SmiteshP/nvim-navic", "Afourcat/treesitter-terraform-doc.nvim"}, config = _1_})}
