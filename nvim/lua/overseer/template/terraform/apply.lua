-- [nfnl] Compiled from lua/overseer/template/terraform/apply.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return {cmd = {"terraform", "apply"}, components = {"open_output", "default"}}
end
return {name = "terraform apply", condition = {filetype = {"tf", "terraform"}}, builder = _1_}
