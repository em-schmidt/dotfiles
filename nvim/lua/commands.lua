-- [nfnl] Compiled from lua/commands.fnl by https://github.com/Olical/nfnl, do not edit.
local function register_commands()
  local function _1_()
    return vim.lsp.buf.format()
  end
  return vim.api.nvim_create_autocmd("BufWritePre", {pattern = {"*.tf", "*.tfvars"}, callback = _1_})
end
return {register_commands = register_commands}
