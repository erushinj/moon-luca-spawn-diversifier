local difficulty = LSD:get_difficulty()

function GroupAITweakData:_init_unit_categories_normal()
	self.special_unit_spawn_limits.shield = 2
	self.special_unit_spawn_limits.medic = 0
	self.special_unit_spawn_limits.taser = 0
	self.special_unit_spawn_limits.tank = 0
	self.special_unit_spawn_limits.spooc = 0

	local access_type_walk_only = {
		walk = true
	}
	local access_type_all = {
		acrobatic = true,
		walk = true
	}

	self.unit_categories = {
		Phalanx_minion = self.unit_categories.Phalanx_minion,
		Phalanx_vip = self.unit_categories.Phalanx_vip,
	}

	self.unit_categories.bulldozer = {
		access = access_type_all,
		special_type = "tank",
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870") },
		}
	}
	self.unit_categories.FBI_tank = self.unit_categories.bulldozer
	self.unit_categories.shield = {
		access = access_type_walk_only,
		special_type = "shield",
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_shield_2/ene_shield_2") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45") },
		}
	}
	self.unit_categories.FBI_shield = self.unit_categories.shield
	self.unit_categories.taser = {
		access = access_type_all,
		special_type = "taser",
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale") },
		}
	}
	self.unit_categories.cloaker = {
		access = access_type_all,
		special_type = "spooc",
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_spook_1/ene_spook_1") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale") },
		}
	}
	self.unit_categories.medic_RF = {
		access = access_type_all,
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale") },
		}
	}
	self.unit_categories.medic_SG = {
		access = access_type_all,
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870") },
		}
	}
	self.unit_categories.glass_RF = {
		access = access_type_all,
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_cop_3/ene_cop_3") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale") },
		}
	}
	self.unit_categories.glass_SG = {
		access = access_type_all,
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_cop_4/ene_cop_4") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870") },
		}
	}
	self.unit_categories.marshal_RF = {
		access = access_type_all,
		unit_types = {
			america = { Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1") },
			russia = { Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2") },
			zombie = { Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1") },
			murkywater = { Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2") },
			federales = { Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2") },
		}
	}
	self.unit_categories.marshal_marksman = self.unit_categories.marshal_RF
	self.unit_categories.marshal_SG = {
		access = access_type_walk_only,
		unit_types = {
			america = { Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1") },
			russia = { Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2") },
			zombie = { Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1") },
			murkywater = { Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2") },
			federales = { Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2") },
		}
	}
	self.unit_categories.marshal_shield = self.unit_categories.marshal_SG

	self.unit_categories.swat_RF = {
		access = access_type_all,
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_swat_1/ene_swat_1") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale") },
		}
	}
	self.unit_categories.swat_SG = {
		access = access_type_all,
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_swat_2/ene_swat_2") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870") },
		}
	}
	self.unit_categories.heavy_RF = {
		access = access_type_all,
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale") },
		}
	}
	self.unit_categories.heavy_SG = {
		access = access_type_all,
		unit_types = {
			america = { Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870") },
			russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870") },
			zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870") },
			murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") },
			federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870") },
		}
	}
end

function GroupAITweakData:_init_unit_categories_hard()
	self:_init_unit_categories_normal()

	self.special_unit_spawn_limits.shield = 2
	self.special_unit_spawn_limits.medic = 0
	self.special_unit_spawn_limits.taser = 1
	self.special_unit_spawn_limits.tank = 0
	self.special_unit_spawn_limits.spooc = 0
end
function GroupAITweakData:_init_unit_categories_overkill()
	self:_init_unit_categories_hard()

	self.special_unit_spawn_limits.shield = 4
	self.special_unit_spawn_limits.medic = 0
	self.special_unit_spawn_limits.taser = 1
	self.special_unit_spawn_limits.tank = 1
	self.special_unit_spawn_limits.spooc = 1

	self.unit_categories.shield.unit_types = {
		america = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9") },
	}

	self.unit_categories.glass_RF.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2") }
	self.unit_categories.glass_RF.unit_types.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass") }
	self.unit_categories.glass_RF.unit_types.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2") }
	self.unit_categories.glass_SG.unit_types.america = { Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") }
	self.unit_categories.glass_SG.unit_types.russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870") }
	self.unit_categories.glass_SG.unit_types.zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3") }

	self.unit_categories.swat_RF.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi") },
	}
	self.unit_categories.swat_SG.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870") },
	}
	self.unit_categories.heavy_RF.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi") },
	}
	self.unit_categories.heavy_SG.unit_types = {
		america = { Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870") },
	}
end
function GroupAITweakData:_init_unit_categories_overkill_145()
	self:_init_unit_categories_overkill()

	self.special_unit_spawn_limits.shield = 4
	self.special_unit_spawn_limits.medic = 2
	self.special_unit_spawn_limits.taser = 2
	self.special_unit_spawn_limits.tank = 1
	self.special_unit_spawn_limits.spooc = 2

	table.insert(self.unit_categories.bulldozer.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"))
	table.insert(self.unit_categories.bulldozer.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"))
	table.insert(self.unit_categories.bulldozer.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"))
	table.insert(self.unit_categories.bulldozer.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"))
	table.insert(self.unit_categories.bulldozer.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"))
end
function GroupAITweakData:_init_unit_categories_easy_wish()
	self:_init_unit_categories_overkill_145()

	self.special_unit_spawn_limits.shield = 6
	self.special_unit_spawn_limits.medic = 3
	self.special_unit_spawn_limits.taser = 3
	self.special_unit_spawn_limits.tank = 2
	self.special_unit_spawn_limits.spooc = 3

	table.insert(self.unit_categories.bulldozer.unit_types.america, Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"))
	table.insert(self.unit_categories.bulldozer.unit_types.russia, Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"))
	table.insert(self.unit_categories.bulldozer.unit_types.zombie, Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"))
	table.insert(self.unit_categories.bulldozer.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"))
	table.insert(self.unit_categories.bulldozer.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"))

	self.unit_categories.shield.unit_types = {
		america = { Idstring("units/payday2/characters/ene_city_shield/ene_city_shield") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9") },
	}

	self.unit_categories.swat_RF.unit_types = {
		america = { Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city") },
	}
	self.unit_categories.swat_SG.unit_types = {
		america = { Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870") },
	}
	self.unit_categories.heavy_RF.unit_types = {
		america = { Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36") },
	}
	self.unit_categories.heavy_SG.unit_types = {
		america = { Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870") },
	}
end
function GroupAITweakData:_init_unit_categories_overkill_290()
	self:_init_unit_categories_easy_wish()

	self.special_unit_spawn_limits.shield = 6
	self.special_unit_spawn_limits.medic = 4
	self.special_unit_spawn_limits.taser = 4
	self.special_unit_spawn_limits.tank = 2
	self.special_unit_spawn_limits.spooc = 4

	table.insert(self.unit_categories.bulldozer.unit_types.america, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
	table.insert(self.unit_categories.bulldozer.unit_types.russia, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
	table.insert(self.unit_categories.bulldozer.unit_types.zombie, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"))
	table.insert(self.unit_categories.bulldozer.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"))
	table.insert(self.unit_categories.bulldozer.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"))

	self.unit_categories.swat_RF.unit_types.america = { Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1") }
end
function GroupAITweakData:_init_unit_categories_sm_wish()
	self:_init_unit_categories_overkill_290()

	self.special_unit_spawn_limits.shield = 8
	self.special_unit_spawn_limits.medic = 5
	self.special_unit_spawn_limits.taser = 5
	self.special_unit_spawn_limits.tank = 3
	self.special_unit_spawn_limits.spooc = 5

	self.unit_categories.bulldozer.unit_types.america = {
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
		Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
		Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
	}

	table.insert(self.unit_categories.bulldozer.unit_types.russia, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"))
	table.insert(self.unit_categories.bulldozer.unit_types.zombie, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"))
	table.insert(self.unit_categories.bulldozer.unit_types.murkywater, Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"))
	table.insert(self.unit_categories.bulldozer.unit_types.federales, Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"))

	self.unit_categories.shield.unit_types = {
		america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9") },
	}
	self.unit_categories.taser.unit_types.america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer") }
	self.unit_categories.cloaker.unit_types.america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker") }

	self.unit_categories.swat_RF.unit_types = {
		america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale") },
	}
	self.unit_categories.swat_SG.unit_types = self.unit_categories.swat_RF.unit_types
	self.unit_categories.heavy_RF.unit_types = {
		america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy") },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36") },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1") },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy") },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale") },
	}
	self.unit_categories.heavy_SG.unit_types = self.unit_categories.heavy_RF.unit_types
end

Hooks:PostHook( GroupAITweakData, "_init_unit_categories", "lsd__init_unit_categories", function(self, difficulty_index)
	-- these are used later to set new factions to america if any are added
	-- there will likely be crash typos in fbi agent unit names and other inconsistencies otherwise
	local faction_reference = {}
	for faction in pairs(self.unit_categories.spooc.unit_types) do
		faction_reference[faction] = true
	end
	local supported_factions = {
		america = true,
		russia = true,
		zombie = true,
		murkywater = true,
		federales = true
	}

	self["_init_unit_categories_" .. difficulty](self)

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

	for faction, _ in pairs(faction_reference) do
		if not supported_factions[faction] then
			for _, category in pairs(self.unit_categories) do
				if category.unit_types and category.unit_types.america then
					category.unit_types[faction] = clone(category.unit_types.america)
				end
			end
		end
	end

end )

function GroupAITweakData:_init_enemy_spawn_groups_level_normal()
	self.enemy_spawn_groups.swats = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 3, 3 },
		spawn = {
			{
				rank = 1,
				unit = "swat_RF",
				tactics = self._tactics.swat_RF,
				amount_min = 2,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "swat_SG",
				tactics = self._tactics.swat_SG,
				amount_min = 1,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.heavys = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 3, 3 },
		spawn = {
			{
				rank = 1,
				unit = "heavy_RF",
				tactics = self._tactics.heavy_RF,
				amount_min = 2,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "heavy_SG",
				tactics = self._tactics.heavy_SG,
				amount_min = 1,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.shields = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.shields,
		amount = { 3, 3 },
		spawn = {
			{
				rank = 2,
				unit = "shield",
				tactics = self._tactics.shield,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "heavy_RF",
				tactics = self._tactics.heavy_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.tasers = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.tasers,
		amount = { 3, 3 },
		spawn = {
			{
				rank = 2,
				unit = "taser",
				tactics = self._tactics.taser,
				amount_min = 1,
				amount_max = 1,
				freq = 1
			},
			{
				rank = 1,
				unit = "swat_RF",
				tactics = self._tactics.swat_RF,
				amount_min = 2,
				amount_max = 2,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.bulldozers = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.bulldozers,
		amount = { 3, 3 },
		spawn = {
			{
				rank = 2,
				unit = "bulldozer",
				tactics = self._tactics.bulldozer,
				amount_min = 1,
				amount_max = 1,
				freq = 1
			},
			{
				rank = 1,
				unit = "swat_RF",
				tactics = self._tactics.swat_RF,
				amount_min = 2,
				amount_max = 2,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.cloakers = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.cloakers,
		amount = { 1, 1 },
		spawn = {
			{
				rank = 1,
				unit = "cloaker",
				tactics = self._tactics.cloaker,
				amount_min = 1,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.marshal_squad = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.shields,
		spawn_cooldown = 30,
		max_nr_simultaneous_groups = 1,
		initial_spawn_delay = 300,
		amount = { 1, 2 },
		spawn = {
			{
				rank = 1,
				unit = "marshal_RF",
				tactics = self._tactics.marshal_RF,
				amount_min = 1,
				amount_max = 1,
				freq = 1
			},
			{
				rank = 1,
				unit = "marshal_SG",
				tactics = self._tactics.marshal_SG,
				amount_min = 0,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.recon = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "glass_RF",
				tactics = self._tactics.glass_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "glass_SG",
				tactics = self._tactics.glass_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.reenforce = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "glass_RF",
				tactics = self._tactics.glass_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "glass_SG",
				tactics = self._tactics.glass_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
		}
	}
end

function GroupAITweakData:_init_enemy_spawn_groups_level_hard()
	self:_init_enemy_spawn_groups_level_normal()
end

function GroupAITweakData:_init_enemy_spawn_groups_level_overkill()
	self.enemy_spawn_groups.swats = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 3, 4 },
		spawn = {
			{
				rank = 1,
				unit = "swat_RF",
				tactics = self._tactics.swat_RF,
				amount_min = 2,
				amount_max = 3,
				freq = 1
			},
			{
				rank = 1,
				unit = "swat_SG",
				tactics = self._tactics.swat_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.heavys = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 3, 4 },
		spawn = {
			{
				rank = 1,
				unit = "heavy_RF",
				tactics = self._tactics.heavy_RF,
				amount_min = 2,
				amount_max = 3,
				freq = 1
			},
			{
				rank = 1,
				unit = "heavy_SG",
				tactics = self._tactics.heavy_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.shields = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.shields,
		amount = { 4, 4 },
		spawn = {
			{
				rank = 3,
				unit = "shield",
				tactics = self._tactics.shield,
				amount_min = 2,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 2,
				unit = "heavy_RF",
				tactics = self._tactics.heavy_RF,
				amount_min = 0,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 2,
				unit = "heavy_SG",
				tactics = self._tactics.heavy_SG,
				amount_min = 0,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "medic_RF",
				tactics = self._tactics.medic_RF,
				amount_min = 0,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.tasers = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.tasers,
		amount = { 4, 4 },
		spawn = {
			{
				rank = 2,
				unit = "taser",
				tactics = self._tactics.taser,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "swat_RF",
				tactics = self._tactics.swat_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "swat_SG",
				tactics = self._tactics.swat_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.bulldozers = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.bulldozers,
		amount = { 4, 4 },
		spawn = {
			{
				rank = 2,
				unit = "bulldozer",
				tactics = self._tactics.bulldozer,
				amount_min = 1,
				amount_max = 1,
				freq = 1
			},
			{
				rank = 1,
				unit = "swat_RF",
				tactics = self._tactics.swat_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "swat_SG",
				tactics = self._tactics.swat_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.cloakers = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.cloakers,
		amount = { 1, 2 },
		spawn = {
			{
				rank = 1,
				unit = "cloaker",
				tactics = self._tactics.cloaker,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.marshal_squad = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.shields,
		spawn_cooldown = 25,
		max_nr_simultaneous_groups = 1,
		initial_spawn_delay = 250,
		amount = { 2, 2 },
		spawn = {
			{
				rank = 2,
				unit = "marshal_RF",
				tactics = self._tactics.marshal_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 2,
				unit = "marshal_SG",
				tactics = self._tactics.marshal_SG,
				amount_min = 0,
				amount_max = 1,
				freq = 1
			},
			{
				rank = 1,
				unit = "glass",
				tactics = self._tactics.glass,
				amount_min = 0,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.recon = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "glass_RF",
				tactics = self._tactics.glass_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "glass_SG",
				tactics = self._tactics.glass_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "taser",
				tactics = self._tactics.taser,
				amount_min = 0,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.reenforce = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "swat_RF",
				tactics = self._tactics.swat_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "swat_SG",
				tactics = self._tactics.swat_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "glass",
				tactics = self._tactics.glass,
				amount_min = 0,
				amount_max = 1,
				freq = 1
			},
		}
	}
end

function GroupAITweakData:_init_enemy_spawn_groups_level_overkill_145()
	self:_init_enemy_spawn_groups_level_overkill()
end

function GroupAITweakData:_init_enemy_spawn_groups_level_easy_wish()
	self.enemy_spawn_groups.swats = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 4, 4 },
		spawn = {
			{
				rank = 2,
				unit = "swat_RF",
				tactics = self._tactics.swat_RF,
				amount_min = 2,
				amount_max = 3,
				freq = 1
			},
			{
				rank = 2,
				unit = "swat_SG",
				tactics = self._tactics.swat_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "glass_RF",
				tactics = self._tactics.glass_RF,
				amount_min = 0,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.heavys = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 4, 4 },
		spawn = {
			{
				rank = 1,
				unit = "heavy_RF",
				tactics = self._tactics.heavy_RF,
				amount_min = 2,
				amount_max = 3,
				freq = 1
			},
			{
				rank = 1,
				unit = "heavy_SG",
				tactics = self._tactics.heavy_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.shields = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.shields,
		amount = { 5, 5 },
		spawn = {
			{
				rank = 3,
				unit = "shield",
				tactics = self._tactics.shield,
				amount_min = 2,
				amount_max = 3,
				freq = 1
			},
			{
				rank = 2,
				unit = "heavy_RF",
				tactics = self._tactics.heavy_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 2,
				unit = "heavy_SG",
				tactics = self._tactics.heavy_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "medic_RF",
				tactics = self._tactics.medic_RF,
				amount_min = 0,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.tasers = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.tasers,
		amount = { 5, 5 },
		spawn = {
			{
				rank = 4,
				unit = "taser",
				tactics = self._tactics.taser,
				amount_min = 2,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 3,
				unit = "swat_RF",
				tactics = self._tactics.swat_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 3,
				unit = "swat_SG",
				tactics = self._tactics.swat_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 2,
				unit = "glass_SG",
				tactics = self._tactics.glass_SG,
				amount_min = 0,
				amount_max = 1,
				freq = 1
			},
			{
				rank = 1,
				unit = "medic",
				tactics = self._tactics.medic,
				amount_min = 0,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.bulldozers = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.bulldozers,
		amount = { 5, 5 },
		spawn = {
			{
				rank = 3,
				unit = "bulldozer",
				tactics = self._tactics.bulldozer,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 2,
				unit = "heavy_RF",
				tactics = self._tactics.heavy_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 2,
				unit = "heavy_SG",
				tactics = self._tactics.heavy_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "medic_SG",
				tactics = self._tactics.medic_SG,
				amount_min = 0,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.cloakers = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.cloakers,
		amount = { 1, 3 },
		spawn = {
			{
				rank = 1,
				unit = "cloaker",
				tactics = self._tactics.cloaker,
				amount_min = 1,
				amount_max = 3,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.marshal_squad = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.shields,
		spawn_cooldown = 20,
		max_nr_simultaneous_groups = 1,
		initial_spawn_delay = 200,
		amount = { 2, 3 },
		spawn = {
			{
				rank = 2,
				unit = "marshal_RF",
				tactics = self._tactics.marshal_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 2,
				unit = "marshal_SG",
				tactics = self._tactics.marshal_SG,
				amount_min = 0,
				amount_max = 1,
				freq = 1
			},
			{
				rank = 1,
				unit = "glass",
				tactics = self._tactics.glass,
				amount_min = 1,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.recon = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 3, 4 },
		spawn = {
			{
				rank = 1,
				unit = "glass_RF",
				tactics = self._tactics.glass_RF,
				amount_min = 1,
				amount_max = 3,
				freq = 1
			},
			{
				rank = 1,
				unit = "glass_SG",
				tactics = self._tactics.glass_SG,
				amount_min = 1,
				amount_max = 3,
				freq = 1
			},
			{
				rank = 1,
				unit = "taser",
				tactics = self._tactics.taser,
				amount_min = 0,
				amount_max = 2,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.reenforce = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "swat",
				tactics = self._tactics.swat,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "heavy",
				tactics = self._tactics.heavy,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "glass",
				tactics = self._tactics.glass,
				amount_min = 0,
				amount_max = 1,
				freq = 1
			},
		}
	}
end

function GroupAITweakData:_init_enemy_spawn_groups_level_overkill_290()
	self:_init_enemy_spawn_groups_level_easy_wish()
end

function GroupAITweakData:_init_enemy_spawn_groups_level_sm_wish()
	self.enemy_spawn_groups.swats = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 4, 4 },
		spawn = {
			{
				rank = 2,
				unit = "swat_RF",
				tactics = self._tactics.swat_RF,
				amount_min = 3,
				amount_max = 3,
				freq = 1
			},
			{
				rank = 1,
				unit = "glass_RF",
				tactics = self._tactics.glass_RF,
				amount_min = 1,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.heavys = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 4, 4 },
		spawn = {
			{
				rank = 1,
				unit = "heavy_RF",
				tactics = self._tactics.heavy_RF,
				amount_min = 2,
				amount_max = 3,
				freq = 1
			},
			{
				rank = 1,
				unit = "heavy_SG",
				tactics = self._tactics.heavy_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.shields = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.shields,
		amount = { 6, 6 },
		spawn = {
			{
				rank = 3,
				unit = "shield",
				tactics = self._tactics.shield,
				amount_min = 3,
				amount_max = 3,
				freq = 1
			},
			{
				rank = 2,
				unit = "heavy_RF",
				tactics = self._tactics.heavy_RF,
				amount_min = 1,
				amount_max = 1,
				freq = 1
			},
			{
				rank = 2,
				unit = "heavy_SG",
				tactics = self._tactics.heavy_SG,
				amount_min = 1,
				amount_max = 1,
				freq = 1
			},
			{
				rank = 1,
				unit = "medic_RF",
				tactics = self._tactics.medic_RF,
				amount_min = 1,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.tasers = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.tasers,
		amount = { 6, 6 },
		spawn = {
			{
				rank = 3,
				unit = "taser",
				tactics = self._tactics.taser,
				amount_min = 2,
				amount_max = 3,
				freq = 1
			},
			{
				rank = 2,
				unit = "glass_RF",
				tactics = self._tactics.glass_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 2,
				unit = "glass_SG",
				tactics = self._tactics.glass_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "medic",
				tactics = self._tactics.medic,
				amount_min = 1,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.bulldozers = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.bulldozers,
		amount = { 6, 6 },
		spawn = {
			{
				rank = 3,
				unit = "bulldozer",
				tactics = self._tactics.bulldozer,
				amount_min = 2,
				amount_max = 3,
				freq = 1
			},
			{
				rank = 2,
				unit = "heavy_RF",
				tactics = self._tactics.heavy_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 2,
				unit = "heavy_SG",
				tactics = self._tactics.heavy_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "medic_SG",
				tactics = self._tactics.medic_SG,
				amount_min = 1,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.cloakers = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.cloakers,
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "cloaker",
				tactics = self._tactics.cloaker,
				amount_min = 2,
				amount_max = 3,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.marshal_squad = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.shields,
		spawn_cooldown = 15,
		max_nr_simultaneous_groups = 1,
		initial_spawn_delay = 150,
		amount = { 3, 3 },
		spawn = {
			{
				rank = 2,
				unit = "marshal_RF",
				tactics = self._tactics.marshal_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 2,
				unit = "marshal_SG",
				tactics = self._tactics.marshal_SG,
				amount_min = 0,
				amount_max = 1,
				freq = 1
			},
			{
				rank = 1,
				unit = "glass_RF",
				tactics = self._tactics.glass,
				amount_min = 1,
				amount_max = 1,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.recon = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 4, 4 },
		spawn = {
			{
				rank = 1,
				unit = "glass_RF",
				tactics = self._tactics.glass_RF,
				amount_min = 1,
				amount_max = 3,
				freq = 1
			},
			{
				rank = 1,
				unit = "glass_SG",
				tactics = self._tactics.glass_SG,
				amount_min = 1,
				amount_max = 3,
				freq = 1
			},
			{
				rank = 1,
				unit = "taser",
				tactics = self._tactics.taser,
				amount_min = 0,
				amount_max = 2,
				freq = 1
			},
		}
	}
	self.enemy_spawn_groups.reenforce = {
		spawn_point_chk_ref = self._spawn_point_chk_ref.swats,
		amount = { 2, 3 },
		spawn = {
			{
				rank = 1,
				unit = "heavy_RF",
				tactics = self._tactics.heavy_RF,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			},
			{
				rank = 1,
				unit = "heavy_SG",
				tactics = self._tactics.heavy_SG,
				amount_min = 1,
				amount_max = 2,
				freq = 1
			}
		}
	}
end


Hooks:PostHook( GroupAITweakData, "_init_enemy_spawn_groups_level", "lsd__init_enemy_spawn_groups_level", function(self, tweak_data, difficulty_index)

	self._tactics = {
		Phalanx_minion = self._tactics.Phalanx_minion,
		Phalanx_vip = self._tactics.Phalanx_vip,
		spooc = self._tactics.spooc,
		glass_RF = {
			"shield_cover",
			"flank",
			"murder",
		},
		glass_SG = {
			"shield_cover",
			"flank",
			"charge",
			"murder",
		},
		glass = {
			"shield_cover",
			"ranged_fire",
			"murder",
		},
		heavy_RF = {
			"shield_cover",
			"smoke_grenade",
			"ranged_fire",
			"deathguard",
		},
		heavy_SG = {
			"shield_cover",
			"flash_grenade",
			"charge",
			"deathguard",
		},
		heavy = {
			"shield_cover",
			"deathguard",
		},
		light_RF = {
			"shield_cover",
			"flash_grenade",
			"flank",
		},
		light_SG = {
			"shield_cover",
			"smoke_grenade",
			"deathguard",
		},
		light = {
			"shield_cover",
		},
		shield = {
			"shield",
			"deathguard",
			"ranged_fire",
		},
		taser = {
			"shield",
			"murder",
			"flash_grenade",
		},
		bulldozer = {
			"shield",
			"murder",
			"smoke_grenade",
		},
		cloaker = {
			"shield_cover",
			"flank",
			"smoke_grenade",
		},
		medic_RF = {
			"shield_cover",
			"ranged_fire",
			"flank",
		},
		medic_SG = {
			"shield_cover",
			"ranged_fire",
			"deathguard",
		},
		medic = {
			"shield_cover",
			"ranged_fire",
		},
		marshal_RF = {
			"shield_cover",
			"ranged_fire",
		},
		marshal_SG = {
			"shield",
			"ranged_fire",
		},
	}

	self.enemy_spawn_groups = {
		Phalanx = self.enemy_spawn_groups.Phalanx,
		single_spooc = self.enemy_spawn_groups.single_spooc,
	}

	self._spawn_point_chk_ref = {
		swats = {
			tac_swat_rifle_flank = true,
		},
		shields = {
			tac_shield_wall = true,
			tac_shield_wall_ranged = true,
			tac_shield_wall_charge = true,
		},
		tasers = {
			tac_tazer_charge = true,
			tac_tazer_flanking = true,
		},
		bulldozers = {
			tac_bull_rush = true,
		},
		cloakers = {
			FBI_spoocs = true,
		}
	}

	self["_init_enemy_spawn_groups_level_" .. difficulty](self)

end )

function GroupAITweakData:_init_task_data_normal()
	self.smoke_grenade_lifetime = 8
	self.smoke_and_flash_grenade_timeout = { 15, 20 }

	self.besiege.assault.force = { 20, 30, 40 }
	self.besiege.assault.force_pool = { 50, 100, 150 }
	self.besiege.assault.sustain_duration_min = { 90, 120, 150 }
	self.besiege.assault.delay = { 30, 25, 20 }
	self.besiege.assault.hostage_hesitation_delay = { 30, 30, 30 }
	self.besiege.assault.groups = {
		swats = { 8, 7, 6 },
		heavys = { 0, 1, 2 },
		shields = { 0, 1, 1 },
		tasers = { 0, 0, 0 },
		bulldozers = { 0, 0, 0 },
		cloakers = { 0, 0, 0 },
	}

	self.besiege.reenforce.interval = { 25, 25, 25 }

	self.besiege.recon.force = { 2, 4, 6 }
	self.besiege.recon.interval = { 5, 5, 5 }
end

function GroupAITweakData:_init_task_data_hard()
	self.smoke_grenade_lifetime = 10
	self.smoke_and_flash_grenade_timeout = { 15, 17.5 }

	self.besiege.assault.force = { 28, 38, 48 }
	self.besiege.assault.force_pool = { 50, 100, 150 }
	self.besiege.assault.sustain_duration_min = { 105, 150, 195 }
	self.besiege.assault.delay = { 30, 25, 20 }
	self.besiege.assault.hostage_hesitation_delay = { 30, 30, 30 }
	self.besiege.assault.groups = {
		swats = { 8, 7, 6 },
		heavys = { 0, 1, 2 },
		shields = { 0, 1, 1 },
		tasers = { 0, 1, 1 },
		bulldozers = { 0, 0, 0 },
		cloakers = { 0, 0, 0 },
	}

	self.besiege.reenforce.interval = { 20, 25, 25 }

	self.besiege.recon.force = { 2, 4, 6 }
	self.besiege.recon.interval = { 5, 4, 3 }
end

function GroupAITweakData:_init_task_data_overkill()
	self.smoke_grenade_lifetime = 12
	self.smoke_and_flash_grenade_timeout = { 15, 15 }

	self.besiege.assault.force = { 28, 38, 48 }
	self.besiege.assault.force_pool = { 50, 100, 150 }
	self.besiege.assault.sustain_duration_min = { 105, 150, 195 }
	self.besiege.assault.delay = { 25, 20, 15 }
	self.besiege.assault.hostage_hesitation_delay = { 20, 20, 20 }
	self.besiege.assault.groups = {
		swats = { 7, 6, 5 },
		heavys = { 1, 2, 3 },
		shields = { 0, 1, 2 },
		tasers = { 0, 1, 2 },
		bulldozers = { 0, 1, 1 },
		cloakers = { 0, 1, 1 },
	}

	self.besiege.reenforce.interval = { 20, 20, 25 }

	self.besiege.recon.force = { 2, 4, 6 }
	self.besiege.recon.interval = { 4, 3, 2 }
end

function GroupAITweakData:_init_task_data_overkill_145()
	self.smoke_grenade_lifetime = 14
	self.smoke_and_flash_grenade_timeout = { 12.5, 15 }

	self.besiege.assault.force = { 36, 46, 56 }
	self.besiege.assault.force_pool = { 75, 125, 175 }
	self.besiege.assault.sustain_duration_min = { 120, 180, 240 }
	self.besiege.assault.delay = { 25, 20, 15 }
	self.besiege.assault.hostage_hesitation_delay = { 10, 10, 10 }
	self.besiege.assault.groups = {
		swats = { 7, 6, 5 },
		heavys = { 1, 2, 3 },
		shields = { 0, 2, 2 },
		tasers = { 0, 1, 2 },
		bulldozers = { 0, 1, 1 },
		cloakers = { 0, 1, 1 },
	}

	self.besiege.reenforce.interval = { 20, 20, 20 }

	self.besiege.recon.force = { 4, 5, 6 }
	self.besiege.recon.interval = { 3, 2, 1 }
end

function GroupAITweakData:_init_task_data_easy_wish()
	self.smoke_grenade_lifetime = 16
	self.smoke_and_flash_grenade_timeout = { 10, 15 }

	self.besiege.assault.force = { 36, 46, 56 }
	self.besiege.assault.force_pool = { 75, 125, 175 }
	self.besiege.assault.sustain_duration_min = { 180, 240, 300 }
	self.besiege.assault.delay = { 25, 20, 15 }
	self.besiege.assault.hostage_hesitation_delay = { 0, 0, 0 }
	self.besiege.assault.groups = {
		swats = { 6, 5, 4 },
		heavys = { 2, 3, 4 },
		shields = { 1, 2, 2 },
		tasers = { 0, 1, 2 },
		bulldozers = { 0, 1, 1 },
		cloakers = { 0, 1, 2 },
	}

	self.besiege.reenforce.interval = { 15, 20, 20 }

	self.besiege.recon.force = { 4, 5, 6 }
	self.besiege.recon.interval = { 0, 0, 0 }
end

function GroupAITweakData:_init_task_data_overkill_290()
	self.smoke_grenade_lifetime = 18
	self.smoke_and_flash_grenade_timeout = { 7.5, 15 }

	self.besiege.assault.force = { 44, 54, 64 }
	self.besiege.assault.force_pool = { 100, 150, 200 }
	self.besiege.assault.sustain_duration_min = { 180, 240, 300 }
	self.besiege.assault.delay = { 20, 15, 10 }
	self.besiege.assault.hostage_hesitation_delay = { 0, 0, 0 }
	self.besiege.assault.groups = {
		swats = { 5, 4, 3 },
		heavys = { 3, 4, 5 },
		shields = { 2, 2, 2 },
		tasers = { 1, 1, 2 },
		bulldozers = { 1, 1, 2 },
		cloakers = { 1, 1, 2 },
	}

	self.besiege.reenforce.interval = { 15, 15, 20 }

	self.besiege.recon.force = { 6, 6, 6 }
	self.besiege.recon.interval = { 0, 0, 0 }
end

function GroupAITweakData:_init_task_data_sm_wish()
	self.smoke_grenade_lifetime = 20
	self.smoke_and_flash_grenade_timeout = { 5, 15 }

	self.besiege.assault.force = { 60, 70, 80 }
	self.besiege.assault.force_pool = { 200, 275, 350 }
	self.besiege.assault.sustain_duration_min = { 200, 300, 400 }
	self.besiege.assault.delay = { 20, 15, 10 }
	self.besiege.assault.hostage_hesitation_delay = { 0, 0, 0 }
	self.besiege.assault.groups = {
		swats = { 4, 3, 2 },
		heavys = { 4, 5, 6 },
		shields = { 2, 2, 2 },
		tasers = { 2, 2, 2 },
		bulldozers = { 2, 2, 2 },
		cloakers = { 2, 2, 2 }
	}

	self.besiege.reenforce.interval = { 15, 15, 15 }

	self.besiege.recon.force = { 6, 8, 10 }
	self.besiege.recon.interval = { 0, 0, 0 }
end


Hooks:PostHook( GroupAITweakData, "_init_task_data", "lsd__init_task_data", function(self, difficulty_index)

	self["_init_task_data_" .. difficulty](self)

	self.besiege.assault.force_balance_mul = { 0.25, 0.5, 0.75, 1 }
	self.besiege.assault.force_pool_balance_mul = { 0.4, 0.5, 0.67, 1 }
	self.besiege.assault.sustain_duration_max = self.besiege.assault.sustain_duration_min
	self.besiege.assault.sustain_duration_balance_mul = { 1, 1, 1, 1 }
	self.besiege.assault.groups.single_spooc = { 0, 0, 0 }
	self.besiege.assault.groups.Phalanx = { 0, 0, 0 }
	self.besiege.assault.groups.snowman_boss = { 0, 0, 0 }

	self.besiege.reenforce.groups = {
		reenforce = { 1, 1, 1 },
	}

	self.besiege.recon.interval_variation = 0
	self.besiege.recon.groups = {
		recon = { 1, 1, 1 },
		single_spooc = { 0, 0, 0 },
		Phalanx = { 0, 0, 0 },
		snowman_boss = { 0, 0, 0 },
	}


	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)

end )
