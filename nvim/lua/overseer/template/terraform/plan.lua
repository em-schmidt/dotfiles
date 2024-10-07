-- [nfnl] Compiled from lua/overseer/template/terraform/plan.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return {cmd = {"terraform", "plan"}, components = {"open_output", "default"}}
end
return {name = "terraform plan", condition = {filetype = {"tf", "terraform"}}, builder = _1_}
