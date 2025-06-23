-- [nfnl] lua/overseer/template/clojure/init.fnl
local overseer = require("overseer")
local tmpl
local function _1_(params)
  return {cmd = {params.bin}, args = params.args, cwd = params}
end
tmpl = {priority = 60, params = {args = {optional = true, type = "list", delimiter = " "}, cwd = {optional = true}, bin = {optional = true, type = "string"}}, builder = _1_}
local function get_depsfile(opts)
  return vim.fs.find("deps.edn", {upward = true, type = "file", path = opts.dir})[1]
end
local function _2_(opts)
  return get_depsfile(opts)
end
local function _3_(opts)
  if (0 == vim.fn.executable("clojure")) then
    return false, "Command 'clojure' not found"
  elseif not get_depsfile(opts) then
    return false, "No deps.edn found"
  else
    return true
  end
end
local function _5_(opts, cb)
  local depsfile = assert(get_depsfile(opts))
  local cwd = vim.fs.dirname(depsfile)
  return {}
end
return {cache_key = _2_, condition = {callback = _3_}, generator = _5_}
