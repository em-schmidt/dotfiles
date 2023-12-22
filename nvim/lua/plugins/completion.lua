-- [nfnl] Compiled from lua/plugins/completion.fnl by https://github.com/Olical/nfnl, do not edit.
local u = require("util")
local function _1_()
  do end (require("copilot")).setup({})
  return (require("copilot_cmp")).setup({})
end
local function _2_()
  local cmp = require("cmp")
  local lspkind = require("lspkind")
  local luasnip = require("luasnip")
  vim.o.completeopt = "menu,menuone,noselect"
  local function _3_(fallback)
    if cmp.visible() then
      return cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      return luasnip.expand_or_jump()
    elseif "else" then
      return fallback()
    else
      return nil
    end
  end
  local function _5_(fallback)
    if cmp.visible() then
      return cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      return luasnip.jump(-1)
    elseif "else" then
      return fallback()
    else
      return nil
    end
  end
  local function _7_(args)
    return luasnip.lsp_expand(args.body)
  end
  cmp.setup({experimental = {ghost_text = {hl_group = "Comment"}}, formatting = {fields = {"abbr", "kind", "menu"}, format = lspkind.cmp_format({maxwidth = 50, mode = "symbol", symbol_map = {Copilot = "\239\132\147"}})}, mapping = {["<c-space>"] = cmp.mapping(cmp.mapping.complete({i = "c"})), ["<cr>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true}), ["<c-e>"] = cmp.mapping({i = cmp.mapping.abort()}), ["<tab>"] = cmp.mapping(_3_, {"i", "s"}), ["<s-tab>"] = cmp.mapping(_5_, {"i", "s"})}, snippet = {expand = _7_}, sources = {{name = "nvim_lsp"}, {name = "copilot"}, {name = "conjure"}, {name = "buffer"}, {name = "luasnip"}}})
  local cmp0 = require("cmp")
  cmp0.setup.cmdline("/", {mapping = cmp0.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
  return cmp0.setup.cmdline(":", {mapping = cmp0.mapping.preset.cmdline(), sources = cmp0.config.sources({{name = "path"}, {name = "cmdline"}})})
end
return {u.tx("zbirenbaum/copilot-cmp", {dependencies = {"zbirenbaum/copilot.lua"}, config = _1_}), u.tx("hrsh7th/nvim-cmp", {dependencies = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-cmdline", "hrsh7th/cmp-path", "onsails/lspkind.nvim", "PaterJason/cmp-conjure", "saadparwaiz1/cmp_luasnip", "L3MON4D3/LuaSnip"}, config = _2_})}
