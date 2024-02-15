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
  local has_words_before_cursor_3f
  local function _3_()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return ((col ~= 0) and (((vim.api.nvim_buf_get_lines(0, (line - 1), line, true))[1]):sub(col, col):match("%s") == nil))
  end
  has_words_before_cursor_3f = _3_
  vim.o.completeopt = "menu,menuone,noselect"
  local function _4_(fallback)
    if cmp.visible() then
      return cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      return luasnip.expand_or_jump()
    elseif has_words_before_cursor_3f() then
      return cmp.complete()
    else
      return fallback()
    end
  end
  local function _6_(fallback)
    if cmp.visible() then
      return cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      return luasnip.jump(-1)
    else
      return fallback()
    end
  end
  local function _8_(args)
    return luasnip.lsp_expand(args.body)
  end
  cmp.setup({experimental = {ghost_text = {hl_group = "Comment"}}, formatting = {fields = {"abbr", "kind", "menu"}, format = lspkind.cmp_format({maxwidth = 50, mode = "symbol_text", symbol_map = {Copilot = "\239\132\147"}})}, mapping = {["<c-space>"] = cmp.mapping(cmp.mapping.complete()), ["<cr>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true}), ["<c-e>"] = cmp.mapping({i = cmp.mapping.abort()}), ["<tab>"] = cmp.mapping(_4_, {"i", "s"}), ["<s-tab>"] = cmp.mapping(_6_, {"i", "s"})}, snippet = {expand = _8_}, sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "luasnip"}, {name = "copilot"}, {name = "conjure"}, {name = "buffer"}}), window = {completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered()}})
  cmp.setup.cmdline({"/", "?"}, {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
  return cmp.setup.cmdline(":", {mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{name = "path"}, {name = "cmdline"}})})
end
return {u.tx("zbirenbaum/copilot-cmp", {dependencies = {"zbirenbaum/copilot.lua"}, config = _1_}), u.tx("hrsh7th/nvim-cmp", {dependencies = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-cmdline", "hrsh7th/cmp-path", "onsails/lspkind.nvim", "PaterJason/cmp-conjure", "saadparwaiz1/cmp_luasnip", "L3MON4D3/LuaSnip"}, config = _2_})}
