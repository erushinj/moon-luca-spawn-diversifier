if StreamHeist then
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

		for grp, _ in pairs(groups) do
			groups[grp] = { 0, 0, 0 }
		end

		for grp, weights in pairs(weights[typ] or static[typ]) do
			groups[grp] = weights
		end
	end
end

function GroupAITweakData:_lsd_init_group_ai_data_normal(data)
	self.special_unit_spawn_limits.shield = 2
	self.special_unit_spawn_limits.medic = 0
	self.special_unit_spawn_limits.taser = 1
	self.special_unit_spawn_limits.tank = 0
	self.special_unit_spawn_limits.spooc = 0

	self.unit_categories.glass_RF.unit_types.america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") }
	self.unit_categories.glass_RF.unit_types.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass") }
	self.unit_categories.glass_RF.unit_types.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3") }
	self.unit_categories.glass_SG.unit_types.america = { Idstring("units/payday2/characters/ene_cop_4/ene_cop_4") }
	self.unit_categories.glass_SG.unit_types.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg") }
	self.unit_categories.glass_SG.unit_types.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4") }
	self.unit_categories.bulldozer.unit_types.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870") }

	self.enemy_spawn_groups.swats = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 3, 3 },
		spawn = {
			{ rank = 1, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "swat_SG", tactics = data.tactics.swat_SG, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.heavys = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 3, 3 },
		spawn = {
			{ rank = 1, unit = "heavy_RF", tactics = data.tactics.heavy_RF, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "heavy_SG", tactics = data.tactics.heavy_SG, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.shields = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.shields,
		amount = { 3, 3 },
		spawn = {
			{ rank = 2, unit = "shield", tactics = data.tactics.shield, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "heavy_RF", tactics = data.tactics.heavy_RF, amount_min = 2, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.tasers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.tasers,
		amount = { 3, 3 },
		spawn = {
			{ rank = 2, unit = "taser", tactics = data.tactics.taser, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 2, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.bulldozers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.bulldozers,
		amount = { 3, 3 },
		spawn = {
			{ rank = 2, unit = "bulldozer", tactics = data.tactics.bulldozer, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 2, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.cloakers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.cloakers,
		amount = { 1, 1 },
		spawn = {
			{ rank = 1, unit = "cloaker", tactics = data.tactics.cloaker, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.marshal_squad = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.shields,
		spawn_cooldown = 30,
		max_nr_simultaneous_groups = 1,
		initial_spawn_delay = 300,
		amount = { 1, 2 },
		spawn = {
			{ rank = 1, unit = "marshal_RF", tactics = data.tactics.marshal_RF, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "marshal_SG", tactics = data.tactics.marshal_SG, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.recon = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{ rank = 1, unit = "glass_RF", tactics = data.tactics.glass_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "glass_SG", tactics = data.tactics.glass_SG, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.reenforce = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{ rank = 1, unit = "glass_RF", actics = data.tactics.glass_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "glass_SG", tactics = data.tactics.glass_SG, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}

	self.smoke_grenade_lifetime = 8
	self.smoke_and_flash_grenade_timeout = { 15, 20 }

	self.besiege.assault.force = { 20, 30, 40 }
	self.besiege.assault.force_pool = { 50, 100, 150 }
	self.besiege.assault.sustain_duration_min = { 75, 105, 135 }
	self.besiege.assault.sustain_duration_max = { 90, 120, 150 }
	self.besiege.assault.delay = { 30, 25, 20 }
	self.besiege.assault.hostage_hesitation_delay = { 30, 30, 30 }

	self.besiege.reenforce.interval = { 25, 25, 25 }

	self.besiege.recon.force = { 2, 4, 6 }
	self.besiege.recon.interval = { 5, 5, 5 }

	self:_lsd_set_weights({
		assault = {
			swats = { 8, 7, 6 },
			heavys = { 0, 1, 2 },
			shields = { 0, 1, 1 },
			tasers = { 0, 0, 0 },
			bulldozers = { 0, 0, 0 },
			cloakers = { 0, 0, 0 },
		},
	})
end

function GroupAITweakData:_lsd_init_group_ai_data_hard(data)
	self.special_unit_spawn_limits.shield = 2
	self.special_unit_spawn_limits.medic = 0
	self.special_unit_spawn_limits.taser = 1
	self.special_unit_spawn_limits.tank = 1
	self.special_unit_spawn_limits.spooc = 0

	self.unit_categories.glass_RF.unit_types.america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") }
	self.unit_categories.glass_RF.unit_types.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass") }
	self.unit_categories.glass_RF.unit_types.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3") }
	self.unit_categories.glass_SG.unit_types.america = { Idstring("units/payday2/characters/ene_cop_4/ene_cop_4") }
	self.unit_categories.glass_SG.unit_types.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg") }
	self.unit_categories.glass_SG.unit_types.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4") }
	self.unit_categories.bulldozer.unit_types.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870") }

	self.enemy_spawn_groups.swats = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 3, 3 },
		spawn = {
			{ rank = 1, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "swat_SG", tactics = data.tactics.swat_SG, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.heavys = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 3, 3 },
		spawn = {
			{ rank = 1, unit = "heavy_RF", tactics = data.tactics.heavy_RF, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "heavy_SG", tactics = data.tactics.heavy_SG, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.shields = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.shields,
		amount = { 3, 3 },
		spawn = {
			{ rank = 2, unit = "shield", tactics = data.tactics.shield, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "heavy_RF", tactics = data.tactics.heavy_RF, amount_min = 2, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.tasers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.tasers,
		amount = { 3, 3 },
		spawn = {
			{ rank = 2, unit = "taser", tactics = data.tactics.taser, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 2, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.bulldozers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.bulldozers,
		amount = { 3, 3 },
		spawn = {
			{ rank = 2, unit = "bulldozer", tactics = data.tactics.bulldozer, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 2, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.cloakers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.cloakers,
		amount = { 1, 1 },
		spawn = {
			{ rank = 1, unit = "cloaker", tactics = data.tactics.cloaker, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.marshal_squad = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.shields,
		spawn_cooldown = 30,
		max_nr_simultaneous_groups = 1,
		initial_spawn_delay = 300,
		amount = { 1, 2 },
		spawn = {
			{ rank = 1, unit = "marshal_RF", tactics = data.tactics.marshal_RF, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "marshal_SG", tactics = data.tactics.marshal_SG, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.recon = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{ rank = 1, unit = "glass_RF", tactics = data.tactics.glass_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "glass_SG", tactics = data.tactics.glass_SG, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.reenforce = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{ rank = 1, unit = "glass_RF", actics = data.tactics.glass_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "glass_SG", tactics = data.tactics.glass_SG, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}

	self.smoke_grenade_lifetime = 10
	self.smoke_and_flash_grenade_timeout = { 15, 17.5 }

	self.besiege.assault.force = { 28, 38, 48 }
	self.besiege.assault.force_pool = { 50, 100, 150 }
	self.besiege.assault.sustain_duration_min = { 80, 130, 180 }
	self.besiege.assault.sustain_duration_max = { 120, 180, 240 }
	self.besiege.assault.delay = { 30, 25, 20 }
	self.besiege.assault.hostage_hesitation_delay = { 30, 30, 30 }

	self.besiege.reenforce.interval = { 20, 25, 25 }

	self.besiege.recon.force = { 2, 4, 6 }
	self.besiege.recon.interval = { 5, 4, 3 }

	self:_lsd_set_weights({
		assault = {
			swats = { 7, 6, 5 },
			heavys = { 1, 2, 3 },
			shields = { 0, 1, 1 },
			tasers = { 0, 1, 1 },
			bulldozers = { 0, 0, 1 },
			cloakers = { 0, 0, 0 },
		},
	})
end

function GroupAITweakData:_lsd_init_group_ai_data_overkill(data)
	self.special_unit_spawn_limits.shield = 4
	self.special_unit_spawn_limits.medic = 0
	self.special_unit_spawn_limits.taser = 2
	self.special_unit_spawn_limits.tank = 1
	self.special_unit_spawn_limits.spooc = 1

	self.unit_categories.swat_SG.unit_types.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870") }
	self.unit_categories.swat_SG.unit_types.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870") }
	self.unit_categories.heavy_RF.unit_types.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy") }
	self.unit_categories.heavy_RF.unit_types.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi") }
	self.unit_categories.bulldozer.unit_types.federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870") }

	self.enemy_spawn_groups.swats = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 3, 4 },
		spawn = {
			{ rank = 1, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "swat_SG", tactics = data.tactics.swat_SG, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.heavys = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 3, 4 },
		spawn = {
			{ rank = 1, unit = "heavy_RF", tactics = data.tactics.heavy_RF, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "heavy_SG", tactics = data.tactics.heavy_SG, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.shields = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.shields,
		amount = { 4, 4 },
		spawn = {
			{ rank = 3, unit = "shield", tactics = data.tactics.shield, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "heavy_RF", tactics = data.tactics.heavy_RF, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "medic_RF", tactics = data.tactics.medic_RF, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.tasers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.tasers,
		amount = { 4, 4 },
		spawn = {
			{ rank = 2, unit = "taser", tactics = data.tactics.taser, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "swat_SG", tactics = data.tactics.swat_SG, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.bulldozers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.bulldozers,
		amount = { 4, 4 },
		spawn = {
			{ rank = 2, unit = "bulldozer", tactics = data.tactics.bulldozer, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "swat_SG", tactics = data.tactics.swat_SG, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.cloakers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.cloakers,
		amount = { 1, 2 },
		spawn = {
			{ rank = 1, unit = "cloaker", tactics = data.tactics.cloaker, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.marshal_squad = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.shields,
		spawn_cooldown = 25,
		max_nr_simultaneous_groups = 1,
		initial_spawn_delay = 250,
		amount = { 2, 2 },
		spawn = {
			{ rank = 2, unit = "marshal_RF", tactics = data.tactics.marshal_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "marshal_SG", tactics = data.tactics.marshal_SG, amount_min = 0, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "glass", tactics = data.tactics.glass, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.recon = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{ rank = 1, unit = "glass_RF", tactics = data.tactics.glass_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "glass_SG", tactics = data.tactics.glass_SG, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "taser", tactics = data.tactics.taser, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.reenforce = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{ rank = 1, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "swat_SG", tactics = data.tactics.swat_SG, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "glass", tactics = data.tactics.glass, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}

	self.smoke_grenade_lifetime = 12
	self.smoke_and_flash_grenade_timeout = { 12.5, 17.5 }

	self.besiege.assault.force = { 28, 38, 48 }
	self.besiege.assault.force_pool = { 50, 100, 150 }
	self.besiege.assault.sustain_duration_min = { 120, 160, 200 }
	self.besiege.assault.sustain_duration_max = { 120, 180, 240 }
	self.besiege.assault.delay = { 25, 20, 15 }
	self.besiege.assault.hostage_hesitation_delay = { 20, 20, 20 }

	self.besiege.reenforce.interval = { 20, 20, 25 }

	self.besiege.recon.force = { 2, 4, 6 }
	self.besiege.recon.interval = { 4, 3, 2 }

	self:_lsd_set_weights({
		assault = {
			swats = { 6, 5, 4 },
			heavys = { 2, 3, 4 },
			shields = { 0, 1, 2 },
			tasers = { 0, 1, 2 },
			bulldozers = { 0, 1, 1 },
			cloakers = { 0, 1, 1 },
		},
	})
end

function GroupAITweakData:_lsd_init_group_ai_data_overkill_145(data)
	self.special_unit_spawn_limits.shield = 4
	self.special_unit_spawn_limits.medic = 2
	self.special_unit_spawn_limits.taser = 2
	self.special_unit_spawn_limits.tank = 2
	self.special_unit_spawn_limits.spooc = 2

	self.enemy_spawn_groups.swats = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 3, 4 },
		spawn = {
			{ rank = 1, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "swat_SG", tactics = data.tactics.swat_SG, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.heavys = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 3, 4 },
		spawn = {
			{ rank = 1, unit = "heavy_RF", tactics = data.tactics.heavy_RF, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "heavy_SG", tactics = data.tactics.heavy_SG, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.shields = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.shields,
		amount = { 4, 4 },
		spawn = {
			{ rank = 3, unit = "shield", tactics = data.tactics.shield, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "heavy_RF", tactics = data.tactics.heavy_RF, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "medic_RF", tactics = data.tactics.medic_RF, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.tasers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.tasers,
		amount = { 4, 4 },
		spawn = {
			{ rank = 2, unit = "taser", tactics = data.tactics.taser, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "swat_SG", tactics = data.tactics.swat_SG, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.bulldozers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.bulldozers,
		amount = { 4, 4 },
		spawn = {
			{ rank = 2, unit = "bulldozer", tactics = data.tactics.bulldozer, amount_min = 1, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "swat_SG", tactics = data.tactics.swat_SG, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.cloakers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.cloakers,
		amount = { 1, 2 },
		spawn = {
			{ rank = 1, unit = "cloaker", tactics = data.tactics.cloaker, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.marshal_squad = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.shields,
		spawn_cooldown = 25,
		max_nr_simultaneous_groups = 1,
		initial_spawn_delay = 250,
		amount = { 2, 2 },
		spawn = {
			{ rank = 2, unit = "marshal_RF", tactics = data.tactics.marshal_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "marshal_SG", tactics = data.tactics.marshal_SG, amount_min = 0, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "glass", tactics = data.tactics.glass, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.recon = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{ rank = 1, unit = "glass_RF", tactics = data.tactics.glass_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "glass_SG", tactics = data.tactics.glass_SG, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "taser", tactics = data.tactics.taser, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.reenforce = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{ rank = 1, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "swat_SG", tactics = data.tactics.swat_SG, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "glass", tactics = data.tactics.glass, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}

	self.smoke_grenade_lifetime = 14
	self.smoke_and_flash_grenade_timeout = { 12.5, 15 }

	self.besiege.assault.force = { 36, 46, 56 }
	self.besiege.assault.force_pool = { 75, 125, 175 }
	self.besiege.assault.sustain_duration_min = { 120, 180, 240 }
	self.besiege.assault.sustain_duration_max = { 120, 180, 240 }
	self.besiege.assault.delay = { 25, 20, 15 }
	self.besiege.assault.hostage_hesitation_delay = { 10, 10, 10 }

	self.besiege.reenforce.interval = { 20, 20, 20 }

	self.besiege.recon.force = { 4, 5, 6 }
	self.besiege.recon.interval = { 3, 2, 1 }

	self:_lsd_set_weights({
		assault = {
			swats = { 5, 4, 3 },
			heavys = { 3, 4, 5 },
			shields = { 0, 2, 2 },
			tasers = { 0, 1, 2 },
			bulldozers = { 0, 1, 1 },
			cloakers = { 0, 1, 1 },
		},
	})
end

function GroupAITweakData:_lsd_init_group_ai_data_easy_wish(data)
	self.special_unit_spawn_limits.shield = 6
	self.special_unit_spawn_limits.medic = 3
	self.special_unit_spawn_limits.taser = 3
	self.special_unit_spawn_limits.tank = 3
	self.special_unit_spawn_limits.spooc = 3

	table.insert(self.unit_categories.bulldozer.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"))
	table.insert(self.unit_categories.bulldozer.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"))
	table.insert(self.unit_categories.bulldozer.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"))
	table.insert(self.unit_categories.bulldozer.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"))
	table.insert(self.unit_categories.bulldozer.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"))

	self.unit_categories.swat_RF.unit_types.america = { Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3") }
	self.unit_categories.swat_SG.unit_types.america = { Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2") }
	self.unit_categories.heavy_SG.unit_types.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") }

	self.enemy_spawn_groups.swats = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 4, 4 },
		spawn = {
			{ rank = 2, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 2, unit = "swat_SG", tactics = data.tactics.swat_SG, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "glass_RF", tactics = data.tactics.glass_RF, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.heavys = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 4, 4 },
		spawn = {
			{ rank = 1, unit = "heavy_RF", tactics = data.tactics.heavy_RF, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "heavy_SG", tactics = data.tactics.heavy_SG, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.shields = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.shields,
		amount = { 5, 5 },
		spawn = {
			{ rank = 3, unit = "shield", tactics = data.tactics.shield, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 2, unit = "heavy_RF", tactics = data.tactics.heavy_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "heavy_SG", tactics = data.tactics.heavy_SG, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "medic_RF", tactics = data.tactics.medic_RF, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.tasers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.tasers,
		amount = { 5, 5 },
		spawn = {
			{ rank = 4, unit = "taser", tactics = data.tactics.taser, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 3, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 3, unit = "swat_SG", tactics = data.tactics.swat_SG, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "glass_SG", tactics = data.tactics.glass_SG, amount_min = 0, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "medic", tactics = data.tactics.medic, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.bulldozers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.bulldozers,
		amount = { 5, 5 },
		spawn = {
			{ rank = 3, unit = "bulldozer", tactics = data.tactics.bulldozer, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "heavy_RF", tactics = data.tactics.heavy_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "heavy_SG", tactics = data.tactics.heavy_SG, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "medic_SG", tactics = data.tactics.medic_SG, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.cloakers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.cloakers,
		amount = { 1, 3 },
		spawn = {
			{ rank = 1, unit = "cloaker", tactics = data.tactics.cloaker, amount_min = 1, amount_max = 3, freq = 1 },
		}
	}
	self.enemy_spawn_groups.marshal_squad = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.shields,
		spawn_cooldown = 20,
		max_nr_simultaneous_groups = 1,
		initial_spawn_delay = 200,
		amount = { 2, 3 },
		spawn = {
			{ rank = 2, unit = "marshal_RF", tactics = data.tactics.marshal_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "marshal_SG", tactics = data.tactics.marshal_SG, amount_min = 0, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "glass", tactics = data.tactics.glass, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.recon = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 3, 4 },
		spawn = {
			{ rank = 1, unit = "glass_RF", tactics = data.tactics.glass_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "glass_SG", tactics = data.tactics.glass_SG, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "taser", tactics = data.tactics.taser, amount_min = 0, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.reenforce = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{ rank = 1, unit = "swat", tactics = data.tactics.swat, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "heavy", tactics = data.tactics.heavy, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "glass", tactics = data.tactics.glass, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}

	self.smoke_grenade_lifetime = 16
	self.smoke_and_flash_grenade_timeout = { 10, 15 }

	self.besiege.assault.force = { 36, 46, 56 }
	self.besiege.assault.force_pool = { 75, 125, 175 }
	self.besiege.assault.sustain_duration_min = { 120, 180, 240 }
	self.besiege.assault.sustain_duration_max = { 180, 240, 300 }
	self.besiege.assault.delay = { 25, 20, 15 }
	self.besiege.assault.hostage_hesitation_delay = { 0, 0, 0 }

	self.besiege.reenforce.interval = { 15, 20, 20 }

	self.besiege.recon.force = { 4, 5, 6 }
	self.besiege.recon.interval = { 0, 0, 0 }

	self:_lsd_set_weights({
		assault = {
			swats = { 7, 6, 5 },
			heavys = { 1, 2, 3 },
			shields = { 1, 2, 2 },
			tasers = { 0, 1, 2 },
			bulldozers = { 0, 1, 1 },
			cloakers = { 0, 1, 2 },
		},
	})
end

function GroupAITweakData:_lsd_init_group_ai_data_overkill_290(data)
	self.special_unit_spawn_limits.shield = 6
	self.special_unit_spawn_limits.medic = 4
	self.special_unit_spawn_limits.taser = 4
	self.special_unit_spawn_limits.tank = 3
	self.special_unit_spawn_limits.spooc = 4

	self.unit_categories.swat_SG.unit_types.america = { Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2") }
	self.unit_categories.heavy_SG.unit_types.murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") }

	self.enemy_spawn_groups.swats = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 4, 4 },
		spawn = {
			{ rank = 2, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 2, unit = "swat_SG", tactics = data.tactics.swat_SG, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "glass_RF", tactics = data.tactics.glass_RF, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.heavys = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 4, 4 },
		spawn = {
			{ rank = 1, unit = "heavy_RF", tactics = data.tactics.heavy_RF, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "heavy_SG", tactics = data.tactics.heavy_SG, amount_min = 1, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.shields = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.shields,
		amount = { 5, 5 },
		spawn = {
			{ rank = 3, unit = "shield", tactics = data.tactics.shield, amount_min = 2, amount_max = 3, freq = 1 },
			{ rank = 2, unit = "heavy_RF", tactics = data.tactics.heavy_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "heavy_SG", tactics = data.tactics.heavy_SG, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "medic_RF", tactics = data.tactics.medic_RF, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.tasers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.tasers,
		amount = { 5, 5 },
		spawn = {
			{ rank = 4, unit = "taser", tactics = data.tactics.taser, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 3, unit = "swat_RF", tactics = data.tactics.swat_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 3, unit = "swat_SG", tactics = data.tactics.swat_SG, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "glass_SG", tactics = data.tactics.glass_SG, amount_min = 0, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "medic", tactics = data.tactics.medic, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.bulldozers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.bulldozers,
		amount = { 5, 5 },
		spawn = {
			{ rank = 3, unit = "bulldozer", tactics = data.tactics.bulldozer, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "heavy_RF", tactics = data.tactics.heavy_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "heavy_SG", tactics = data.tactics.heavy_SG, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "medic_SG", tactics = data.tactics.medic_SG, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.cloakers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.cloakers,
		amount = { 1, 3 },
		spawn = {
			{ rank = 1, unit = "cloaker", tactics = data.tactics.cloaker, amount_min = 1, amount_max = 3, freq = 1 },
		}
	}
	self.enemy_spawn_groups.marshal_squad = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.shields,
		spawn_cooldown = 20,
		max_nr_simultaneous_groups = 1,
		initial_spawn_delay = 200,
		amount = { 2, 3 },
		spawn = {
			{ rank = 2, unit = "marshal_RF", tactics = data.tactics.marshal_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "marshal_SG", tactics = data.tactics.marshal_SG, amount_min = 0, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "glass", tactics = data.tactics.glass, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.recon = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 3, 4 },
		spawn = {
			{ rank = 1, unit = "glass_RF", tactics = data.tactics.glass_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "glass_SG", tactics = data.tactics.glass_SG, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "taser", tactics = data.tactics.taser, amount_min = 0, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.reenforce = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{ rank = 1, unit = "swat", tactics = data.tactics.swat, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "heavy", tactics = data.tactics.heavy, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "glass", tactics = data.tactics.glass, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}

	self.smoke_grenade_lifetime = 18
	self.smoke_and_flash_grenade_timeout = { 10, 12.5 }

	self.besiege.assault.force = { 44, 54, 64 }
	self.besiege.assault.force_pool = { 100, 150, 200 }
	self.besiege.assault.sustain_duration_min = { 180, 240, 300 }
	self.besiege.assault.sustain_duration_max = { 180, 240, 300 }
	self.besiege.assault.delay = { 20, 15, 10 }
	self.besiege.assault.hostage_hesitation_delay = { 0, 0, 0 }

	self.besiege.reenforce.interval = { 15, 15, 20 }

	self.besiege.recon.force = { 6, 6, 6 }
	self.besiege.recon.interval = { 0, 0, 0 }

	self:_lsd_set_weights({
		assault = {
			swats = { 6, 5, 4 },
			heavys = { 2, 3, 4 },
			shields = { 2, 2, 2 },
			tasers = { 1, 1, 2 },
			bulldozers = { 1, 1, 2 },
			cloakers = { 1, 1, 2 },
		},
	})
end

function GroupAITweakData:_lsd_init_group_ai_data_sm_wish(data)
	self.special_unit_spawn_limits.shield = 8
	self.special_unit_spawn_limits.medic = 5
	self.special_unit_spawn_limits.taser = 5
	self.special_unit_spawn_limits.tank = 4
	self.special_unit_spawn_limits.spooc = 5

	self.unit_categories.swat_SG.unit_types = self.unit_categories.swat_RF.unit_types
	self.unit_categories.heavy_SG.unit_types = self.unit_categories.heavy_RF.unit_types

	self.enemy_spawn_groups.swats = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 4, 4 },
		spawn = {
			{ rank = 2, unit = "swat", tactics = data.tactics.swat, amount_min = 3, amount_max = 3, freq = 1 },
			{ rank = 1, unit = "glass_RF", tactics = data.tactics.glass_RF, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.heavys = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 4, 4 },
		spawn = {
			{ rank = 1, unit = "heavy", tactics = data.tactics.heavy, amount_min = 4, amount_max = 4, freq = 1 },
		}
	}
	self.enemy_spawn_groups.shields = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.shields,
		amount = { 6, 6 },
		spawn = {
			{ rank = 3, unit = "shield", tactics = data.tactics.shield, amount_min = 3, amount_max = 3, freq = 1 },
			{ rank = 2, unit = "heavy", tactics = data.tactics.heavy, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "medic_RF", tactics = data.tactics.medic_RF, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.tasers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.tasers,
		amount = { 6, 6 },
		spawn = {
			{ rank = 3, unit = "taser", tactics = data.tactics.taser, amount_min = 3, amount_max = 3, freq = 1 },
			{ rank = 2, unit = "glass_SG", tactics = data.tactics.glass_SG, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "medic", tactics = data.tactics.medic, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.bulldozers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.bulldozers,
		amount = { 6, 6 },
		spawn = {
			{ rank = 3, unit = "bulldozer", tactics = data.tactics.bulldozer, amount_min = 3, amount_max = 3, freq = 1 },
			{ rank = 2, unit = "heavy", tactics = data.tactics.heavy, amount_min = 2, amount_max = 2, freq = 1 },
			{ rank = 1, unit = "medic_SG", tactics = data.tactics.medic_SG, amount_min = 0, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.cloakers = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.cloakers,
		amount = { 1, 4 },
		spawn = {
			{ rank = 1, unit = "cloaker", tactics = data.tactics.cloaker, amount_min = 1, amount_max = 4, freq = 1 },
		}
	}
	self.enemy_spawn_groups.marshal_squad = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.shields,
		spawn_cooldown = 15,
		max_nr_simultaneous_groups = 1,
		initial_spawn_delay = 150,
		amount = { 3, 3 },
		spawn = {
			{ rank = 2, unit = "marshal_RF", tactics = data.tactics.marshal_RF, amount_min = 1, amount_max = 2, freq = 1 },
			{ rank = 2, unit = "marshal_SG", tactics = data.tactics.marshal_SG, amount_min = 0, amount_max = 1, freq = 1 },
			{ rank = 1, unit = "glass_RF", tactics = data.tactics.glass, amount_min = 1, amount_max = 1, freq = 1 },
		}
	}
	self.enemy_spawn_groups.recon = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 4, 4 },
		spawn = {
			{ rank = 1, unit = "glass", tactics = data.tactics.glass, amount_min = 2, amount_max = 4, freq = 1 },
			{ rank = 1, unit = "taser", tactics = data.tactics.taser, amount_min = 0, amount_max = 2, freq = 1 },
		}
	}
	self.enemy_spawn_groups.reenforce = {
		spawn_point_chk_ref = data.spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{ rank = 1, unit = "heavy", tactics = data.tactics.heavy, amount_min = 2, amount_max = 3, freq = 1 },
		}
	}

	self.smoke_grenade_lifetime = 20
	self.smoke_and_flash_grenade_timeout = { 7.5, 12.5 }

	self.besiege.assault.force = { 68, 78, 88 }
	self.besiege.assault.force_pool = { 200, 275, 350 }
	self.besiege.assault.sustain_duration_min = { 200, 300, 400 }
	self.besiege.assault.sustain_duration_max = { 400, 500, 600 }
	self.besiege.assault.delay = { 20, 15, 10 }
	self.besiege.assault.hostage_hesitation_delay = { 0, 0, 0 }

	self.besiege.reenforce.interval = { 15, 15, 15 }

	self.besiege.recon.force = { 6, 8, 10 }
	self.besiege.recon.interval = { 0, 0, 0 }

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
		log("[LucaSpawnDiversifier] Changes not applied - missing function for difficulty:", difficulty)

		return
	end

	for new, based_on in pairs({
		bulldozer = "FBI_tank",
		shield = "FBI_shield",
		taser = "CS_tazer",
		cloaker = "spooc",
		medic_RF = "medic_M4",
		medic_SG = "medic_R870",
		glass_RF = "CS_swat_MP5",
		glass_SG = "CS_swat_R870",
		marshal_RF = "marshal_marksman",
		marshal_SG = "marshal_shield",
		swat_RF = "FBI_swat_M4",
		swat_SG = "FBI_swat_R870",
		heavy_RF = "FBI_heavy_G36",
		heavy_SG = "FBI_heavy_R870",
	}) do
		self.unit_categories[new] = self.unit_categories[based_on]
	end

	self.unit_categories.glass_RF.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale") },
	}
	self.unit_categories.glass_SG.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870") },
	}

	local data = {
		spawn_point_chk_ref = {
			swats = table.set("tac_swat_rifle_flank"),
			shields = table.set("tac_shield_wall", "tac_shield_wall_ranged", "tac_shield_wall_charge"),
			tasers = table.set("tac_tazer_charge", "tac_tazer_flanking"),
			bulldozers = table.set("tac_bull_rush"),
			cloakers = table.set("FBI_spoocs"),
		},
		tactics = {
			glass_RF = { "shield_cover", "flank", "murder", },
			glass_SG = { "shield_cover", "flank", "charge", "murder", },
			glass = { "shield_cover", "ranged_fire", "murder", },
			heavy_RF = { "shield_cover", "smoke_grenade", "ranged_fire", "deathguard", },
			heavy_SG = { "shield_cover", "flash_grenade", "charge", "deathguard", },
			heavy = { "shield_cover", "smoke_grenade", "flash_grenade", "deathguard", },
			swat_RF = { "shield_cover", "flash_grenade", "flank", },
			swat_SG = { "shield_cover", "smoke_grenade", "deathguard", },
			swat = { "shield_cover", "smoke_grenade", "flash_grenade", },
			shield = { "shield", "deathguard", "ranged_fire", },
			taser = { "shield", "murder", "flash_grenade", },
			bulldozer = { "shield", "murder", "smoke_grenade", },
			cloaker = { "shield_cover", "flank", "smoke_grenade", },
			medic_RF = { "shield_cover", "ranged_fire", "flank", },
			medic_SG = { "shield_cover", "ranged_fire", "deathguard", },
			medic = { "shield_cover", "ranged_fire", },
			marshal_RF = { "shield_cover", "ranged_fire", },
			marshal_SG = { "shield", "ranged_fire", },
		},
	}

	self[func](self, data)

	-- combined categories
	local function combined_category(category_1, category_2)
		local new_category = deep_clone(category_1)

		for faction, units in pairs(category_2.unit_types) do
			for _, unit in pairs(units) do
				table.insert(new_category.unit_types[faction], unit)
			end
		end

		return new_category
	end

	self.unit_categories.swat = combined_category(self.unit_categories.swat_RF, self.unit_categories.swat_SG)
	self.unit_categories.heavy = combined_category(self.unit_categories.heavy_RF, self.unit_categories.heavy_SG)
	self.unit_categories.glass = combined_category(self.unit_categories.glass_RF, self.unit_categories.glass_SG)
	self.unit_categories.medic = combined_category(self.unit_categories.medic_RF, self.unit_categories.medic_SG)

	self.enemy_spawn_groups.tac_swat_shotgun_rush = {
		amount = { 69, 69 },
		spawn = {
			{ rank = 69, unit = "FBI_heavy_R870", tactics = self._tactics.swat_shotgun_rush, amount_min = 69, amount_max = 69, freq = 69 },
		}
	}

	-- self.besiege.assault.force_balance_mul = { 0.25, 0.5, 0.75, 1 }
	self.besiege.assault.force_balance_mul = { 0.4, 0.6, 0.8, 1 }
	-- self.besiege.assault.force_pool_balance_mul = { 0.5, 0.67, 0.83, 1 }
	self.besiege.assault.force_pool_balance_mul = { 0.6, 0.73, 0.87, 1 }
	self.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }

	self.besiege.recon.interval_variation = 0

	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)
end )
