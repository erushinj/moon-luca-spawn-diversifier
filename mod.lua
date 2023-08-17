if Global.lsd_found_sh or StreamHeist then
	Hooks:Add( "MenuManagerOnOpenMenu", "MenuManagerOnOpenMenuLucaSpawnDiversifier", function()
		if Global.lsd_found_sh then
			return
		end

		Global.lsd_found_sh = true

		local title = "Listen up"
		local message = "Luca's Spawn Diversifier is not made for Streamlined Heisting.\n\nLuca's Spawn Diversifier will deactivate itself until Streamlined Heisting is uninstalled and the game is fully restarted."
		local buttons = {
			{
				text = "Get out of my face"
			}
		}
		QuickMenu:new(title, message, buttons, true)
	end )

	return
end

function GroupAITweakData:_lsd_set_weights(weights)
	local static = {
		assault = {
			swats = { 4, 4, 4 },
			heavys = { 4, 4, 4 },
			shields = { 2, 2, 2 },
			tasers = { 2, 2, 2 },
			bulldozers = { 2, 2, 2 },
			cloakers = { 2, 2, 2 },
		},
		recon = {
			recon = { 1, 1, 1 },
		},
		reenforce = {
			reenforce = { 1, 1, 1 },
		},
	}

	for typ in pairs(static) do
		local groups = self.besiege[typ].groups

		for group, _ in pairs(groups) do
			groups[group] = { 0, 0, 0 }
		end

		for group, weights in pairs(weights and weights[typ] or static[typ]) do
			groups[group] = weights
		end
	end
end

function GroupAITweakData:_lsd_init_group_ai_data_normal(tactics)
	self.unit_categories.FBI_swat_M4.unit_types = self.unit_categories.CS_swat_MP5.unit_types
	self.unit_categories.FBI_swat_R870.unit_types = self.unit_categories.CS_swat_R870.unit_types
	self.unit_categories.FBI_heavy_G36.unit_types = self.unit_categories.CS_heavy_M4.unit_types
	self.unit_categories.FBI_heavy_R870.unit_types = self.unit_categories.CS_heavy_R870.unit_types
	self.unit_categories.FBI_suit_C45_M4.unit_types.america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") }
	self.unit_categories.FBI_suit_C45_M4.unit_types.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass") }
	self.unit_categories.FBI_suit_C45_M4.unit_types.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3") }
	self.unit_categories.FBI_suit_stealth_MP5.unit_types.america = { Idstring("units/payday2/characters/ene_cop_4/ene_cop_4") }
	self.unit_categories.FBI_suit_stealth_MP5.unit_types.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg") }
	self.unit_categories.FBI_suit_stealth_MP5.unit_types.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4") }
	self.unit_categories.FBI_shield.unit_types = self.unit_categories.CS_shield.unit_types

	self:_lsd_init_group_ai_data_overkill_145(tactics)
end

function GroupAITweakData:_lsd_init_group_ai_data_hard(tactics)
	self:_lsd_init_group_ai_data_normal(tactics)
end

function GroupAITweakData:_lsd_init_group_ai_data_overkill(tactics)
	self:_lsd_init_group_ai_data_overkill_145(tactics)
end

function GroupAITweakData:_lsd_init_group_ai_data_overkill_145(tactics)
	self.special_unit_spawn_limits.shield = 4
	self.special_unit_spawn_limits.medic = 2
	self.special_unit_spawn_limits.taser = 2
	self.special_unit_spawn_limits.tank = 2
	self.special_unit_spawn_limits.spooc = 2

	self.enemy_spawn_groups.swats = {
		amount = { 3, 3 },
		spawn = {
			{ rank = 1, unit = "FBI_swat_M4", tactics = tactics.FBI_swat_M4, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "FBI_swat_R870", tactics = tactics.FBI_swat_R870, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.heavys = {
		amount = { 3, 3 },
		spawn = {
			{ rank = 1, unit = "FBI_heavy_G36", tactics = tactics.FBI_heavy_G36, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "FBI_heavy_R870", tactics = tactics.FBI_heavy_R870, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.shields = {
		amount = { 4, 4 },
		spawn = {
			{ rank = 3, unit = "FBI_shield", tactics = tactics.FBI_shield, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 2, unit = "FBI_swat_M4", tactics = tactics.FBI_swat_M4, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "medic_M4", tactics = tactics.medic_M4, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.tasers = {
		amount = { 4, 4 },
		spawn = {
			{ rank = 3, unit = "CS_tazer", tactics = tactics.CS_tazer, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 2, unit = "FBI_swat_M4", tactics = tactics.FBI_swat_M4, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "medic_M4", tactics = tactics.medic_M4, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.bulldozers = {
		amount = { 4, 4 },
		spawn = {
			{ rank = 3, unit = "FBI_tank", tactics = tactics.FBI_tank, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 2, unit = "FBI_swat_M4", tactics = tactics.FBI_swat_M4, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "medic_M4", tactics = tactics.medic_M4, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.cloakers = {
		amount = { 1, 1 },
		spawn = {
			{ rank = 1, unit = "spooc", tactics = tactics.spooc, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.marshal_squad = {
		spawn_cooldown = 60,
		max_nr_simultaneous_groups = 1,
		initial_spawn_delay = 240,
		amount = { 3, 3 },
		spawn = {
			{ rank = 1, unit = "FBI_suit_C45_M4", tactics = tactics.FBI_suit_C45_M4, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "FBI_suit_stealth_MP5", tactics = tactics.FBI_suit_stealth_MP5, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.recon = {
		amount = { 3, 3 },
		spawn = {
			{ rank = 1, unit = "FBI_suit_C45_M4", tactics = tactics.FBI_suit_C45_M4, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "FBI_suit_stealth_MP5", tactics = tactics.FBI_suit_stealth_MP5, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.reenforce = {
		amount = { 3, 3 },
		spawn = {
			{ rank = 1, unit = "FBI_swat_M4", tactics = tactics.FBI_swat_M4, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "FBI_swat_R870", tactics = tactics.FBI_swat_R870, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}

	self.smoke_grenade_lifetime = 10
	self.smoke_and_flash_grenade_timeout = { 15, 20 }

	self.besiege.assault.force = { 30, 40, 50 }
	self.besiege.assault.force_pool = { 50, 125, 200 }
	self.besiege.assault.sustain_duration_min = { 120, 180, 240 }
	self.besiege.assault.sustain_duration_max = { 120, 180, 240 }
	self.besiege.assault.delay = { 20, 15, 10 }
	self.besiege.assault.hostage_hesitation_delay = { 10, 10, 10 }

	self:_lsd_set_weights({
		assault = {
			swats = { 8, 6, 4 },
			heavys = { 0, 2, 4 },
			shields = { 1, 1, 2 },
			tasers = { 1, 1, 2 },
			bulldozers = { 0, 1, 1 },
			cloakers = { 0, 1, 1 },
		},
	})
end

function GroupAITweakData:_lsd_init_group_ai_data_easy_wish(tactics)
	table.insert(self.unit_categories.FBI_tank.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"))
	table.insert(self.unit_categories.FBI_tank.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"))
	table.insert(self.unit_categories.FBI_tank.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"))
	table.insert(self.unit_categories.FBI_tank.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"))
	table.insert(self.unit_categories.FBI_tank.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"))

	self:_lsd_init_group_ai_data_overkill_290(tactics)
end

function GroupAITweakData:_lsd_init_group_ai_data_overkill_290(tactics)
	self.special_unit_spawn_limits.shield = 6
	self.special_unit_spawn_limits.medic = 3
	self.special_unit_spawn_limits.taser = 3
	self.special_unit_spawn_limits.tank = 3
	self.special_unit_spawn_limits.spooc = 3

	self.enemy_spawn_groups.swats = {
		amount = { 4, 4 },
		spawn = {
			{ rank = 2, unit = "FBI_swat_M4", tactics = tactics.FBI_swat_M4, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 2, unit = "FBI_swat_R870", tactics = tactics.FBI_swat_R870, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "FBI_suit_C45_M4", tactics = tactics.FBI_suit_C45_M4, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.heavys = {
		amount = { 4, 4 },
		spawn = {
			{ rank = 1, unit = "FBI_heavy_G36", tactics = tactics.FBI_heavy_G36, amount_min = 3, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "FBI_heavy_R870", tactics = tactics.FBI_heavy_R870, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.shields = {
		amount = { 5, 5 },
		spawn = {
			{ rank = 3, unit = "FBI_shield", tactics = tactics.FBI_shield, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "FBI_heavy_G36", tactics = tactics.FBI_heavy_G36, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "medic_M4", tactics = tactics.medic_M4, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.tasers = {
		amount = { 5, 5 },
		spawn = {
			{ rank = 3, unit = "CS_tazer", tactics = tactics.CS_tazer, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "FBI_suit_stealth_MP5", tactics = tactics.FBI_suit_stealth_MP5, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "medic_M4", tactics = tactics.medic_M4, amount_min = 0, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "medic_R870", tactics = tactics.medic_R870, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.bulldozers = {
		amount = { 5, 5 },
		spawn = {
			{ rank = 3, unit = "FBI_tank", tactics = tactics.FBI_tank, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "FBI_swat_R870", tactics = tactics.FBI_swat_R870, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "medic_R870", tactics = tactics.medic_R870, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.cloakers = {
		amount = { 1, 2 },
		spawn = {
			{ rank = 1, unit = "spooc", tactics = tactics.spooc, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.marshal_squad = {
		spawn_cooldown = 50,
		max_nr_simultaneous_groups = 1,
		initial_spawn_delay = 200,
		amount = { 2, 2 },
		spawn = {
			{ rank = 2, unit = "marshal_marksman", tactics = tactics.marshal_marksman, amount_min = 0, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "marshal_shield", tactics = tactics.marshal_shield, amount_min = 0, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "FBI_suit_stealth_MP5", tactics = tactics.FBI_suit_stealth_MP5, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.recon = {
		amount = { 3, 3 },
		spawn = {
			{ rank = 1, unit = "FBI_suit_C45_M4", tactics = tactics.FBI_suit_C45_M4, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "FBI_suit_stealth_MP5", tactics = tactics.FBI_suit_stealth_MP5, amount_min = 2, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.reenforce = {
		amount = { 3, 3 },
		spawn = {
			{ rank = 1, unit = "FBI_heavy_G36", tactics = tactics.FBI_heavy_G36, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "FBI_heavy_R870", tactics = tactics.FBI_heavy_R870, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}

	self.smoke_grenade_lifetime = 15
	self.smoke_and_flash_grenade_timeout = { 10, 15 }

	self.besiege.assault.force = { 40, 50, 60 }
	self.besiege.assault.force_pool = { 100, 150, 200 }
	self.besiege.assault.sustain_duration_min = { 180, 240, 300 }
	self.besiege.assault.sustain_duration_max = { 180, 240, 300 }
	self.besiege.assault.delay = { 20, 15, 10 }
	self.besiege.assault.hostage_hesitation_delay = { 0, 0, 0 }

	self:_lsd_set_weights({
		assault = {
			swats = { 6, 5, 4 },
			heavys = { 2, 3, 4 },
			shields = { 1, 2, 2 },
			tasers = { 1, 2, 2 },
			bulldozers = { 1, 1, 2 },
			cloakers = { 1, 1, 2 },
		},
	})
end

-- i dont really care about death sentence. take more special spam and guaranteed medics if available.
function GroupAITweakData:_lsd_init_group_ai_data_sm_wish(tactics)
	self.special_unit_spawn_limits.shield = 8
	self.special_unit_spawn_limits.medic = 4
	self.special_unit_spawn_limits.taser = 4
	self.special_unit_spawn_limits.tank = 4
	self.special_unit_spawn_limits.spooc = 4

	self.enemy_spawn_groups.swats = {
		amount = { 4, 4 },
		spawn = {
			{ rank = 2, unit = "FBI_swat_M4", tactics = tactics.FBI_swat_M4, amount_min = 3, amount_max = 3, freq = 1 },
			{ rank = 2, unit = "FBI_swat_R870", tactics = tactics.FBI_swat_R870, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.heavys = {
		amount = { 4, 4 },
		spawn = {
			{ rank = 1, unit = "FBI_heavy_G36", tactics = tactics.FBI_heavy_G36, amount_min = 3, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "FBI_heavy_R870", tactics = tactics.FBI_heavy_R870, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.shields = {
		amount = { 6, 6 },
		spawn = {
			{ rank = 3, unit = "FBI_shield", tactics = tactics.FBI_shield, amount_min = 3, amount_max = 3, freq = 1 },
			{ rank = 2, unit = "FBI_heavy_G36", tactics = tactics.FBI_heavy_G36, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "medic_M4", tactics = tactics.medic_M4, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.tasers = {
		amount = { 6, 6 },
		spawn = {
			{ rank = 3, unit = "CS_tazer", tactics = tactics.CS_tazer, amount_min = 3, amount_max = 3, freq = 1 },
			{ rank = 2, unit = "FBI_heavy_G36", tactics = tactics.FBI_heavy_G36, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "medic_M4", tactics = tactics.medic_M4, amount_min = 0, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "medic_R870", tactics = tactics.medic_R870, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.bulldozers = {
		amount = { 6, 6 },
		spawn = {
			{ rank = 3, unit = "FBI_tank", tactics = tactics.FBI_tank, amount_min = 3, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "FBI_heavy_R870", tactics = tactics.FBI_heavy_R870, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "medic_R870", tactics = tactics.medic_M4, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.cloakers = {
		amount = { 2, 2 },
		spawn = {
			{ rank = 1, unit = "spooc", tactics = tactics.spooc, amount_min = 2, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.marshal_squad = {
		spawn_cooldown = 40,
		max_nr_simultaneous_groups = 1,
		initial_spawn_delay = 160,
		amount = { 3, 3 },
		spawn = {
			{ rank = 2, unit = "marshal_marksman", tactics = tactics.marshal_marksman, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 2, unit = "marshal_shield", tactics = tactics.marshal_shield, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "FBI_heavy_G36", tactics = tactics.FBI_heavy_G36, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.recon = {
		amount = { 3, 3 },
		spawn = {
			{ rank = 1, unit = "FBI_swat_M4", tactics = tactics.FBI_swat_M4, amount_min = 3, amount_max = 3, freq = 1 },
		}
	}
	self.enemy_spawn_groups.reenforce = {
		amount = { 3, 3 },
		spawn = {
			{ rank = 1, unit = "FBI_heavy_G36", tactics = tactics.FBI_heavy_G36, amount_min = 3, amount_max = 3, freq = 1 },
		}
	}

	self.smoke_grenade_lifetime = 20
	self.smoke_and_flash_grenade_timeout = { 5, 10 }

	self.besiege.assault.force = { 70, 80, 90 }
	self.besiege.assault.force_pool = { 500, 750, 1000 }
	self.besiege.assault.sustain_duration_min = { 360, 480, 600 }
	self.besiege.assault.sustain_duration_max = { 360, 480, 600 }
	self.besiege.assault.delay = { 10, 10, 10 }
	self.besiege.assault.hostage_hesitation_delay = { 0, 0, 0 }

	self:_lsd_set_weights({
		assault = {
			swats = { 4, 3, 2 },
			heavys = { 4, 5, 6 },
			shields = { 2, 2, 2 },
			tasers = { 2, 2, 2 },
			bulldozers = { 2, 2, 2 },
			cloakers = { 2, 2, 2 },
		},
	})
end

Hooks:PostHook( GroupAITweakData, "init", "lsd_init", function(self, tweak_data)

	local level_id = Global.game_settings and Global.game_settings.level_id or Global.level_data and Global.level_data.level_id
	local level = tweak_data.levels and tweak_data.levels[level_id]
	if level and level.group_ai_state == "skirmish" then
		log("[LucaSpawnDiversifier] Changes not applied - current level is a Holdout level:", level_id)

		return
	end

	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local func = "_lsd_init_group_ai_data_" .. difficulty
	if not self[func] then
		func = func:gsub(difficulty, "sm_wish")
	end

	self.unit_categories.FBI_suit_C45_M4.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale") },
	}
	self.unit_categories.FBI_suit_stealth_MP5.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870") },
	}

	self[func](self, {
		FBI_suit_C45_M4 = { "shield_cover", "flank", "ranged_fire", "murder", },
		FBI_suit_stealth_MP5 = { "shield_cover", "flank", "charge", "murder", },
		FBI_heavy_G36 = { "shield_cover", "smoke_grenade", "ranged_fire", "deathguard", },
		FBI_heavy_R870 = { "shield_cover", "flash_grenade", "charge", "deathguard", },
		FBI_swat_M4 = { "shield_cover", "flash_grenade", "flank", },
		FBI_swat_R870 = { "shield_cover", "smoke_grenade", "deathguard", },
		FBI_shield = { "FBI_shield", "deathguard", "ranged_fire", },
		CS_tazer = { "FBI_shield", "murder", "flash_grenade", },
		FBI_tank = { "FBI_shield", "murder", "smoke_grenade", },
		spooc = { "shield_cover", "flank", "smoke_grenade", },
		medic_M4 = { "shield_cover", "ranged_fire", "flank", },
		medic_R870 = { "shield_cover", "ranged_fire", "deathguard", },
		marshal_marksman = { "shield_cover", "ranged_fire", },
		marshal_shield = { "FBI_shield", "ranged_fire", },
	})

	self.enemy_spawn_groups.swats.spawn_point_chk_ref = table.set("tac_swat_rifle_flank")
	self.enemy_spawn_groups.heavys.spawn_point_chk_ref = self.enemy_spawn_groups.swats.spawn_point_chk_ref
	self.enemy_spawn_groups.shields.spawn_point_chk_ref = table.set("tac_shield_wall", "tac_shield_wall_ranged", "tac_shield_wall_charge")
	self.enemy_spawn_groups.tasers.spawn_point_chk_ref = table.set("tac_tazer_charge", "tac_tazer_flanking")
	self.enemy_spawn_groups.bulldozers.spawn_point_chk_ref = table.set("tac_bull_rush")
	self.enemy_spawn_groups.cloakers.spawn_point_chk_ref = table.set("FBI_spoocs")
	self.enemy_spawn_groups.marshal_squad.spawn_point_chk_ref = self.enemy_spawn_groups.shields.spawn_point_chk_ref
	self.enemy_spawn_groups.recon.spawn_point_chk_ref = self.enemy_spawn_groups.swats.spawn_point_chk_ref
	self.enemy_spawn_groups.reenforce.spawn_point_chk_ref = self.enemy_spawn_groups.swats.spawn_point_chk_ref

	self.enemy_spawn_groups.tac_swat_shotgun_rush = {
		amount = { 69, 69 },
		spawn = {
			{ rank = 69, unit = "CS_heavy_R870", tactics = self._tactics.swat_shotgun_rush, amount_min = 69, amount_max = 69, freq = 69 },
		}
	}

	self.besiege.assault.force_balance_mul = { 0.4, 0.6, 0.8, 1 }
	self.besiege.assault.force_pool_balance_mul = { 1, 1, 1, 1 }
	self.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }

	self.besiege.recon.interval = { 0, 0, 0 }
	self.besiege.recon.interval_variation = 0
	self.besiege.recon.force = { 6, 6, 6 }

	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)

end )
