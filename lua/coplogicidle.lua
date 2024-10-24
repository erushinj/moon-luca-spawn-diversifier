-- allow reenforce to function (probably)
local _chk_relocate_original = CopLogicIdle._chk_relocate
function CopLogicIdle._chk_relocate(data, ...)
	local objective = data.objective
	local grp_objective_type = objective and objective.grp_objective and objective.grp_objective.type
	local relocate_anyway = grp_objective_type == "retire" or grp_objective_type == "assault_area"
	local defend_area = objective and objective.type == "defend_area"

	return (relocate_anyway or not defend_area) and _chk_relocate_original(data, ...)
end
