-- most vanilla reenforce points have the very weird force value of 1, while reenforce units spawn in groups
-- ensure reenforce points are populated appropriately
local set_area_min_police_force_original = GroupAIStateBesiege.set_area_min_police_force
function GroupAIStateBesiege:set_area_min_police_force(id, force, ...)
	return set_area_min_police_force_original(self, id, force and math.max(force, 2), ...)
end

-- Keep recon groups around during anticipation
-- Making them retreat only afterwards gives them more time to complete their objectives
local _assign_recon_groups_to_retire_original = GroupAIStateBesiege._assign_recon_groups_to_retire
function GroupAIStateBesiege:_assign_recon_groups_to_retire(...)
	if not self._rescue_allowed then
		return _assign_recon_groups_to_retire_original(self, ...)
	end
end

-- Make this function properly set rescue state again for checking if recon tasks are allowed
Hooks:OverrideFunction(GroupAIStateBase, "_set_rescue_state", function (self, state)
	self._rescue_allowed = state
end)


-- Lines 1540-1678
Hooks:OverrideFunction( GroupAIStateBesiege, "_perform_group_spawning", function(self, spawn_task, force, use_last, ...)
	local nr_units_spawned = 0
	local produce_data = {
		name = true,
		spawn_ai = {}
	}
	local unit_categories = tweak_data.group_ai.unit_categories
	local current_unit_type = tweak_data.levels:get_ai_group_type()
	local weap_map = tweak_data.character.weap_map
	local spawn_points = spawn_task.spawn_group.spawn_pts

	-- Lines 1552-1632
	local function _try_spawn_unit(u_type_name, spawn_entry)
		if GroupAIStateBesiege._MAX_SIMULTANEOUS_SPAWNS <= nr_units_spawned and not force then
			return
		end

		local hopeless = true

		for _, sp_data in ipairs(spawn_points) do
			local category = unit_categories[u_type_name]

			if (sp_data.accessibility == "any" or category.access[sp_data.accessibility]) and (not sp_data.amount or sp_data.amount > 0) and sp_data.mission_element:enabled() then
				hopeless = false

				if sp_data.delay_t < self._t then
					local units = category.unit_types[current_unit_type]
					local unit_type_index = math.random(#units)
					produce_data.name = managers.modifiers:modify_value("GroupAIStateBesiege:SpawningUnit", units[unit_type_index])
					local spawned_unit = sp_data.mission_element:produce(produce_data)
					local u_key = spawned_unit:key()
					local objective = nil

					if spawn_task.objective then
						objective = self.clone_objective(spawn_task.objective)
					else
						objective = spawn_task.group.objective.element:get_random_SO(spawned_unit)

						if not objective then
							spawned_unit:set_slot(0)

							return true
						end

						objective.grp_objective = spawn_task.group.objective
					end

					local u_data = self._police[u_key]

					self:set_enemy_assigned(objective.area, u_key)

					local tactics = spawn_entry.tactics
					if tactics then
						u_data.tactics = tactics
						u_data.tactics_map = table.list_to_set(tactics)
					end

					-- new
					local weapon = category.weapon
					if weapon then
						local weapon_id = weapon[current_unit_type] or weapon.america

						if type(weapon_id) == "table" then
							local size = #weapon_id

							weapon_id = weapon_id[unit_type_index % size] or weapon_id[size]
						end

						local weapon_override = weap_map[weapon_id]
						if weapon_override then
							spawned_unit:inventory():add_unit_by_name(weapon_override, true)
							spawned_unit:base()._default_weapon_id = weapon_id
						else
							log("[Luca's Spawn Diversifier] Invalid weapon ID " .. tostring(weapon_id) .. " in spawn group " .. tostring(spawn_task.spawn_group.id))
						end
					end
					-- back to u240.3

					spawned_unit:brain():set_spawn_entry(spawn_entry, u_data.tactics_map)

					u_data.rank = spawn_entry.rank

					self:_add_group_member(spawn_task.group, u_key)

					if spawned_unit:brain():is_available_for_assignment(objective) then
						if objective.element then
							objective.element:clbk_objective_administered(spawned_unit)
						end

						spawned_unit:brain():set_objective(objective)
					else
						spawned_unit:brain():set_followup_objective(objective)
					end

					nr_units_spawned = nr_units_spawned + 1

					if spawn_task.ai_task then
						spawn_task.ai_task.force_spawned = spawn_task.ai_task.force_spawned + 1
						spawned_unit:brain()._logic_data.spawned_in_phase = spawn_task.ai_task.phase
					end

					sp_data.delay_t = self._t + sp_data.interval

					if sp_data.amount then
						sp_data.amount = sp_data.amount - 1
					end

					return true
				end
			end
		end

		if hopeless then
			log("[LSD] Spawn group " .. tostring(spawn_task.spawn_group.id) .. " failed to spawn unit " .. tostring(u_type_name))

			return true
		end
	end

	for u_type_name, spawn_info in pairs(spawn_task.units_remaining) do
		if not unit_categories[u_type_name].access.acrobatic then
			for i = spawn_info.amount, 1, -1 do
				local success = _try_spawn_unit(u_type_name, spawn_info.spawn_entry)

				if success then
					spawn_info.amount = spawn_info.amount - 1
				end

				break
			end
		end
	end

	for u_type_name, spawn_info in pairs(spawn_task.units_remaining) do
		for i = spawn_info.amount, 1, -1 do
			local success = _try_spawn_unit(u_type_name, spawn_info.spawn_entry)

			if success then
				spawn_info.amount = spawn_info.amount - 1
			end

			break
		end
	end

	local complete = true

	for u_type_name, spawn_info in pairs(spawn_task.units_remaining) do
		if spawn_info.amount > 0 then
			complete = false

			break
		end
	end

	if complete then
		spawn_task.group.has_spawned = true

		table.remove(self._spawning_groups, use_last and #self._spawning_groups or 1)

		if spawn_task.group.size <= 0 then
			self._groups[spawn_task.group.id] = nil
		end
	end
end )
