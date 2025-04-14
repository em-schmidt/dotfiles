-- [nfnl] Compiled from lua/lualine/extensions/snacks.fnl by https://github.com/Olical/nfnl, do not edit.
local function get_short_cwd()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
end
local sections = {lualine_a = {get_short_cwd}}
local filetypes = {"snacks_layout_box"}
return {sections = sections, filetypes = filetypes}
