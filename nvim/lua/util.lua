-- [nfnl] lua/util.fnl
local fun = require("vendor.fun")
local function set_vim_global(key, value)
  return vim.api.nvim_set_var(key, value)
end
local function set_vim_option(key, value)
  return vim.api.nvim_set_option_value(key, value, {})
end
local function nnoremap(keys, command, description)
  local map_opts = {noremap = true, desc = description}
  local to_command = (":" .. command .. "<cr>")
  return vim.keymap.set("n", keys, to_command, map_opts)
end
local function lnnoremap(keys, command, description)
  return nnoremap(("<leader>" .. keys), command, description)
end
local function last(xs)
  return fun.nth(fun.length(xs), xs)
end
local function tx(...)
  local args = {...}
  local len = fun.length(args)
  if ("table" == type(last(args))) then
    local function _1_(acc, n, v)
      acc[n] = v
      return acc
    end
    return fun.reduce(_1_, last(args), fun.zip(fun.range(1, len), fun.take((len - 1), args)))
  else
    return args
  end
end
local function nlkm(keys, command, description)
  local lhs = ("<leader>" .. keys)
  local rhs = ("<cmd>" .. command .. "<cr>")
  return tx(lhs, rhs, {desc = description, mode = "n"})
end
local function vlkm(keys, command, description)
  local lhs = ("<leader>" .. keys)
  local rhs = ("<cmd>" .. command .. "<cr>")
  return tx(lhs, rhs, {desc = description, mode = "v"})
end
return {tx = tx, nlkm = nlkm, vlkm = vlkm, lnnoremap = lnnoremap, nnoremap = nnoremap, set_vim_option = set_vim_option, set_vim_global = set_vim_global}
