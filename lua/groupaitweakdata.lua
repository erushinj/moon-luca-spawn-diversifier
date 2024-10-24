Hooks:PostHook( GroupAITweakData, "init", "lsd_init", function(self, tweak_data)
	local difficulty_index = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	local n = difficulty_index <= 2
	local h = difficulty_index == 3
	local vh = difficulty_index == 4
	local ovk = difficulty_index == 5
	local mh = difficulty_index == 6
	local dw = difficulty_index == 7
	local ds = difficulty_index >= 8

	self.special_unit_spawn_limits.shield = 8
	self.special_unit_spawn_limits.medic = 5
	self.special_unit_spawn_limits.taser = 5
	self.special_unit_spawn_limits.tank = 4
	self.special_unit_spawn_limits.spooc = 4

	local function unit_type_stuff(category, new_unit_types)
		local unit_types = category.unit_types

		for k, v in pairs(new_unit_types) do
			unit_types[k] = v
		end
	end

	unit_type_stuff(self.unit_categories.spooc, {
		america = { Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"), },
	})

	self.unit_categories.ZEAL_spooc = deep_clone(self.unit_categories.spooc)
	if ds then
		self.unit_categories.ZEAL_spooc.weapon = {
			america = "smoke",
			russia = "mp5_tactical",
			murkywater = "mp5_tactical",
			federales = "mp5_tactical",
		}
		unit_type_stuff(self.unit_categories.ZEAL_spooc, {
			america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"), },
			zombie = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"), },
		})
	end

	self.unit_categories.CS_swat_MP5.weapon = {
		america = { "raging_bull", "r870", },
	}
	unit_type_stuff(self.unit_categories.CS_swat_MP5, {
		america = {
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"),
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"),
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"),
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"),
		},
	})

	self.unit_categories.CS_heavy_M4.weapon = {
		america = { "g36", "r870", },
	}
	unit_type_stuff(self.unit_categories.CS_heavy_M4, {
		america = {
			Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
			Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"),
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"),
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
		},
	})

	self.unit_categories.CS_tazer.weapon = {
		america = "m4_yellow",
	}
	unit_type_stuff(self.unit_categories.CS_tazer, {
		america = { Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"), },
	})

	self.unit_categories.ZEAL_tazer = deep_clone(self.unit_categories.CS_tazer)
	if ds then
		unit_type_stuff(self.unit_categories.ZEAL_tazer, {
			america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"), },
		})
	end

	self.unit_categories.FBI_suit_C45_M4.weapon = {
		america = { "raging_bull", "raging_bull", "raging_bull", "s552", "ump", "benelli", "benelli", "benelli", },
	}
	unit_type_stuff(self.unit_categories.FBI_suit_C45_M4, {
		america = {
			Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
			Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
			Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
			Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
			Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
			Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"),
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
		},
	})

	self.unit_categories.FBI_suit_stealth_MP5.weapon = {
		america = "benelli",
	}
	unit_type_stuff(self.unit_categories.FBI_suit_stealth_MP5, {
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"), },
	})

	self.unit_categories.FBI_swat_M4.weapon = {
		america = { "scar_murky", "m249", "benelli", },
	}
	unit_type_stuff(self.unit_categories.FBI_swat_M4, {
		america = {
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"),
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
		},
	})

	self.unit_categories.FBI_heavy_G36.weapon = {
		america = { "g36", "r870", }
	}
	unit_type_stuff(self.unit_categories.FBI_heavy_G36, {
		america = {
			Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
			Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"),
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
		},
	})

	self.unit_categories.FBI_shield.weapon = {
		america = "beretta92",
	}
	unit_type_stuff(self.unit_categories.FBI_shield, {
		america = { Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"), },
		zombie = { Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"), },
	})

	self.unit_categories.CITY_shield = deep_clone(self.unit_categories.FBI_shield)
	unit_type_stuff(self.unit_categories.CITY_shield, {
		america = {
			Idstring("units/payday2/characters/ene_city_shield/ene_city_shield"),
			Idstring("units/payday2/characters/ene_city_shield/ene_city_shield"),
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
			Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"),
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"),
		},
	})
	self.unit_categories.CITY_shield.weapon = {
		america = { "deagle", "mp9" },
		russia = { "deagle", "sr2_smg" },
	}

	self.unit_categories.ZEAL_shield = deep_clone(self.unit_categories.FBI_shield)
	self.unit_categories.ZEAL_shield.weapon = {
		america = "mp9",
		russia = "sr2_smg",
	}
	unit_type_stuff(self.unit_categories.ZEAL_shield, {
		america = ds and { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"), } or nil,
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"), },
		zombie = ds and { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"), } or nil,
	})

	self.unit_categories.CITY_swat_M4 = deep_clone(self.unit_categories.FBI_swat_M4)
	self.unit_categories.CITY_swat_M4.weapon = {
		america = ds and "m4" or dw and "g36" or "s552",
		russia = not dw and "ak47_ass" or nil,
	}
	unit_type_stuff(self.unit_categories.CITY_swat_M4, {
		america = { Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"), },
		zombie = { Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"), },
	})

	self.unit_categories.CITY_swat_MP5 = deep_clone(self.unit_categories.CITY_swat_M4)
	self.unit_categories.CITY_swat_MP5.weapon = {
		america = "ump",
		russia = "asval_smg",
	}
	unit_type_stuff(self.unit_categories.CITY_swat_MP5, {
		america = { Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"), },
		zombie = { Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"), },
	})

	self.unit_categories.CITY_swat_R870 = deep_clone(self.unit_categories.FBI_swat_R870)
	unit_type_stuff(self.unit_categories.CITY_swat_R870, {
		america = { Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"), },
		russia = { Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"), },
		zombie = { Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"), },
		murkywater = { Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"), },
		federales = { Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"), },
	})
	self.unit_categories.CITY_swat_R870.weapon = {
		america = "benelli",
		federales = not ds and "r870" or nil,
	}

	self.unit_categories.CITY_heavy_M4 = deep_clone(self.unit_categories.FBI_heavy_G36)
	unit_type_stuff(self.unit_categories.CITY_heavy_M4, {
		america = { Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"), },
		zombie = { Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"), },
	})
	self.unit_categories.CITY_heavy_M4.weapon = self.unit_categories.CITY_swat_M4.weapon

	self.unit_categories.CITY_heavy_R870 = deep_clone(self.unit_categories.FBI_heavy_R870)
	unit_type_stuff(self.unit_categories.CITY_heavy_R870, {
		america = {
			Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
			Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
		},
		zombie = {
			Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
			Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"),
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
		},
	})
	self.unit_categories.CITY_heavy_R870.weapon = self.unit_categories.CITY_swat_R870.weapon

	self.unit_categories.ZEAL_swat_M4 = deep_clone(self.unit_categories.CITY_swat_M4)
	self.unit_categories.ZEAL_swat_M4.weapon = {
		america = "m4",
		russia = "ak47_ass",
	}
	self.unit_categories.ZEAL_swat_R870 = deep_clone(self.unit_categories.CITY_swat_R870)
	self.unit_categories.ZEAL_swat_R870.weapon = {
		america = "r870",
	}
	self.unit_categories.ZEAL_swat_MP5 = deep_clone(self.unit_categories.CITY_swat_MP5)
	self.unit_categories.ZEAL_swat_MP5.weapon = {
		america = "mp5",
		russia = "asval_smg",
		murkywater = "ump",
		federales = "ump",
	}
	self.unit_categories.ZEAL_heavy_M4 = deep_clone(self.unit_categories.CITY_heavy_M4)
	self.unit_categories.ZEAL_heavy_M4.weapon = self.unit_categories.ZEAL_swat_M4.weapon
	self.unit_categories.ZEAL_heavy_R870 = deep_clone(self.unit_categories.CITY_heavy_R870)
	self.unit_categories.ZEAL_heavy_R870.weapon = {
		america = { "r870", "mossberg", },
	}
	if ds then
		unit_type_stuff(self.unit_categories.ZEAL_swat_M4, {
			america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"), },
			zombie = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"), },
		})
		unit_type_stuff(self.unit_categories.ZEAL_swat_R870, {
			america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"), },
			zombie = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"), },
		})
		unit_type_stuff(self.unit_categories.ZEAL_swat_MP5, {
			america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"), },
			zombie = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"), },
		})
		unit_type_stuff(self.unit_categories.ZEAL_heavy_M4, {
			america = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"), },
			zombie = { Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"), },
		})
		unit_type_stuff(self.unit_categories.ZEAL_heavy_R870, {
			america = {
				Idstring("units/pd2_dlc_drm/characters/ene_zeal_swat_heavy_sniper/ene_zeal_swat_heavy_sniper"),
				Idstring("units/pd2_dlc_drm/characters/ene_zeal_swat_heavy_sniper/ene_zeal_swat_heavy_sniper"),
			},
			zombie = {
				Idstring("units/pd2_dlc_drm/characters/ene_zeal_swat_heavy_sniper/ene_zeal_swat_heavy_sniper"),
				Idstring("units/pd2_dlc_drm/characters/ene_zeal_swat_heavy_sniper/ene_zeal_swat_heavy_sniper"),
			},
		})
	end

	self.unit_categories.medic_M4.weapon = {
		america = { "g36", "r870", },
	}
	unit_type_stuff(self.unit_categories.medic_M4, {
		america = {
			Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4"),
			Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870"),
		},
		russia = {
			Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"),
		},
		zombie = {
			Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"),
			Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"),
		},
		murkywater = {
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"),
			Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"),
		},
		federales = {
			Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
			Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"),
		},
	})

	self.unit_categories.marshal_marksman.weapon = {
		america = "g36",
	}
	unit_type_stuff(self.unit_categories.marshal_marksman, {
		america = {
			Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
			Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
		},
		zombie = {
			Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"),
			Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"),
		},
	})

	unit_type_stuff(self.unit_categories.marshal_shield, {
		america = {
			Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"),
			Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
		},
		zombie = {
			Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"),
			Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"),
		},
	})

	for id, data in pairs(self.unit_categories) do
		if data.special_type and not data.is_captain then
			local new_data = clone(data)
			new_data.special_type = nil

			self.unit_categories[id .. "_unlimited"] = new_data
		end
	end

	local groups = self.enemy_spawn_groups
	local tactics = self._tactics
	for k, v in pairs({
		empty = {},
		light_rifle = { "shield_cover", "ranged_fire", },
		light_shotgun = { "shield_cover", "charge", "smoke_grenade", },
		light_smg = { "shield_cover", "flank", "deathguard", },
		heavy_rifle = { "shield_cover", },
		heavy_shotgun = { "shield_cover", "charge", "smoke_grenade", "deathguard", },
		heavy_smg = { "shield_cover", "flank", "flash_grenade", },
		shield_charge = { "shield", "charge", },
		shield_ranged = { "shield", "ranged_fire", },
		taser = { "shield_cover", "flank", "charge", "smoke_grenade", },
		tank = { "shield_cover", "charge", "flash_grenade", "smoke_grenade", },
		medic = { "shield_cover", "smoke_grenade", },
		spooc_sneak = { "shield_cover", "flank", "smoke_grenade", },
		spooc_charge = { "shield_cover", "charge", "smoke_grenade", },
	}) do
		tactics[k] = v
	end

	local swats = table.set("tac_swat_rifle", "tac_swat_rifle_flank")
	local shields = table.set("tac_shield_wall", "tac_shield_wall_ranged", "tac_shield_wall_charge")
	local tasers = table.set("tac_tazer_charge", "tac_tazer_flanking")
	local dozers = table.set("tac_bull_rush")
	local cloakers = table.set("FBI_spoocs", "single_spooc")

	local function spawn_point_check_has_shield(group)
		for _, enemy in pairs(group.spawn) do
			if enemy.unit:match("shield") then
				return clone(shields)
			end
		end

		return clone(swats)
	end


	groups.swat_light = {
		spawn_point_chk_ref = swats,
		amount = { 4, 4, },
		spawn = {
			{ rank = 2, unit = "CS_heavy_M4", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.heavy_smg, },
			{ rank = 1, unit = "FBI_suit_C45_M4", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.light_rifle, },
		},
	}
	groups.swat_medium = {
		spawn_point_chk_ref = swats,
		amount = { 4, 4, },
		spawn = {
			{ rank = 2, unit = "CITY_heavy_R870", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.heavy_shotgun, },
			{ rank = 2, unit = "CITY_heavy_M4", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.heavy_smg, },
			{ rank = 1, unit = "FBI_swat_M4", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.light_rifle, },
		},
	}
	groups.swat_heavy = {
		spawn_point_chk_ref = swats,
		amount = { 4, 4, },
		spawn = {
			{ rank = 1, unit = "ZEAL_heavy_M4", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.heavy_rifle, },
			{ rank = 1, unit = "ZEAL_heavy_R870", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.heavy_shotgun, },
		},
	}
	groups.shield_light = {
		spawn_point_chk_ref = shields,
		amount = { 4, 4, },
		spawn = {
			{ rank = 4, unit = "CS_shield", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.shield_ranged, },
			{ rank = 3, unit = "CITY_swat_M4", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.light_rifle, },
			{ rank = 2, unit = "FBI_swat_M4", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.light_rifle, },
			{ rank = 1, unit = "medic_M4_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.medic, },
		},
	}
	groups.shield_medium = {
		spawn_point_chk_ref = shields,
		amount = { 5, 5, },
		spawn = {
			{ rank = 5, unit = "CITY_shield", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.shield_charge, },
			{ rank = 4, unit = "FBI_shield", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.shield_charge, },
			{ rank = 3, unit = "CITY_swat_M4", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.light_rifle, },
			{ rank = 2, unit = "FBI_heavy_G36", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.heavy_shotgun, },
			{ rank = 1, unit = "medic_M4_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.medic, },
		},
	}
	groups.shield_heavy = {
		spawn_point_chk_ref = shields,
		amount = { 5, 5, },
		spawn = {
			{ rank = 3, unit = "ZEAL_shield", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.shield_charge, },
			{ rank = 2, unit = "ZEAL_heavy_M4", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.heavy_rifle, },
			{ rank = 2, unit = "ZEAL_heavy_R870", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.heavy_shotgun, },
			{ rank = 1, unit = "medic_M4_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.medic, },
		},
	}
	groups.taser_light = {
		spawn_point_chk_ref = tasers,
		amount = { 3, 3, },
		spawn = {
			{ rank = 2, unit = "ZEAL_tazer", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.taser, },
			{ rank = 1, unit = "FBI_suit_stealth_MP5", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.heavy_rifle, },
		},
	}
	groups.taser_medium = {
		spawn_point_chk_ref = tasers,
		amount = { 4, 4, },
		spawn = {
			{ rank = 3, unit = "ZEAL_tazer", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.taser, },
			{ rank = 2, unit = "FBI_suit_stealth_MP5", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.heavy_rifle, },
			{ rank = 1, unit = "medic_M4_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.medic, },
		},
	}
	groups.taser_heavy = {
		spawn_point_chk_ref = tasers,
		amount = { 5, 5, },
		spawn = {
			{ rank = 3, unit = "ZEAL_tazer", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.taser, },
			{ rank = 2, unit = "FBI_suit_C45_M4", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.heavy_rifle, },
			{ rank = 2, unit = "FBI_suit_stealth_MP5", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.heavy_shotgun, },
			{ rank = 1, unit = "ZEAL_spooc_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.spooc_charge, },
			{ rank = 1, unit = "medic_M4_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.medic, },
		},
	}
	groups.dozer_light = {
		spawn_point_chk_ref = dozers,
		amount = { 3, 3, },
		spawn = {
			{ rank = 2, unit = "FBI_tank", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.tank, },
			{ rank = 1, unit = "medic_M4_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.medic, },
		},
	}
	groups.dozer_medium = {
		spawn_point_chk_ref = dozers,
		amount = { 4, 4, },
		spawn = {
			{ rank = 2, unit = "FBI_tank", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.tank, },
			{ rank = 1, unit = "medic_M4_unlimited", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.medic, },
		},
	}
	groups.dozer_heavy = {
		spawn_point_chk_ref = dozers,
		amount = { 6, 6, },
		spawn = {
			{ rank = 3, unit = "FBI_tank", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.tank, },
			{ rank = 2, unit = "ZEAL_shield_unlimited", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.shield_charge, },
			{ rank = 1, unit = "medic_M4_unlimited", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.medic, },
		},
	}
	groups.cloaker_light = {
		spawn_point_chk_ref = cloakers,
		amount = { 1, 1, },
		spawn = {
			{ rank = 1, unit = "ZEAL_spooc", freq = 1, tactics = tactics.spooc_charge, },
			{ rank = 1, unit = "ZEAL_spooc", freq = 1, tactics = tactics.spooc_sneak, },
		},
	}
	groups.cloaker_medium = {
		spawn_point_chk_ref = cloakers,
		amount = { 2, 2, },
		spawn = {
			{ rank = 1, unit = "ZEAL_spooc", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.spooc_charge, },
			{ rank = 1, unit = "ZEAL_spooc", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.spooc_sneak, },
		},
	}
	groups.cloaker_heavy = {
		spawn_point_chk_ref = cloakers,
		amount = { 3, 3, },
		spawn = {
			{ rank = 1, unit = "ZEAL_spooc", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.spooc_charge, },
			{ rank = 1, unit = "ZEAL_spooc", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.spooc_sneak, },
		},
	}
	groups.reenforce_light = {
		spawn_point_chk_ref = shields,
		amount = { 4, 4, },
		spawn = {
			{ rank = 2, unit = "CS_heavy_M4", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.empty, },
			{ rank = 1, unit = "CS_swat_MP5", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.empty, },
		},
	}
	groups.reenforce_medium = {
		spawn_point_chk_ref = shields,
		amount = { 4, 4, },
		spawn = {
			{ rank = 3, unit = "FBI_shield_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 2, unit = "FBI_heavy_G36", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 1, unit = "FBI_swat_M4", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.empty, },
		},
	}
	groups.reenforce_heavy = {
		spawn_point_chk_ref = shields,
		amount = { 4, 4, },
		spawn = {
			{ rank = 3, unit = "CITY_shield_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 2, unit = "CITY_heavy_M4", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 2, unit = "CITY_heavy_R870", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 1, unit = "spooc_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
		},
	}
	groups.recon_light = {
		spawn_point_chk_ref = shields,
		amount = { 3, 3, },
		spawn = {
			{ rank = 2, unit = "FBI_shield_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 1, unit = "FBI_suit_C45_M4", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 1, unit = "FBI_suit_stealth_MP5", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
		},
	}
	groups.recon_medium = {
		spawn_point_chk_ref = shields,
		amount = { 4, 4, },
		spawn = {
			{ rank = 3, unit = "FBI_shield_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 2, unit = "FBI_suit_C45_M4", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 2, unit = "FBI_suit_stealth_MP5", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 1, unit = "medic_M4_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
		},
	}
	groups.recon_heavy = {
		spawn_point_chk_ref = shields,
		amount = { 5, 5, },
		spawn = {
			{ rank = 3, unit = "FBI_shield_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 2, unit = "CITY_swat_M4", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 2, unit = "CITY_swat_R870", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 2, unit = "CITY_swat_MP5", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 1, unit = "medic_M4_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
		},
	}
	groups.recon_taser = {
		spawn_point_chk_ref = shields,
		amount = { 5, 5, },
		spawn = {
			{ rank = 3, unit = "CS_tazer_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 2, unit = "FBI_heavy_G36", freq = 1, amount_min = 3, amount_max = 3, tactics = tactics.empty, },
			{ rank = 1, unit = "medic_M4_unlimited", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
		},
	}
	groups.recon_cloaker = {
		spawn_point_chk_ref = cloakers,
		amount = { 1, 1, },
		spawn = {
			{ rank = 1, unit = "spooc", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
		},
	}
	groups.jerome = {
		spawn_point_chk_ref = swats,
		amount = { 3, 3, },
		spawn = {
			{ rank = 2, unit = "FBI_suit_stealth_MP5", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 1, unit = "FBI_suit_C45_M4", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.empty, },
		},
	}
	groups.good_game_design = {
		spawn_point_chk_ref = swats,
		amount = { 3, 3, },
		spawn = {
			{ rank = 2, unit = "CS_heavy_M4", freq = 1, amount_min = 1, amount_max = 1, tactics = tactics.empty, },
			{ rank = 1, unit = "FBI_heavy_G36", freq = 1, amount_min = 2, amount_max = 2, tactics = tactics.empty, },
		},
	}

	if groups.single_spooc then
		groups.single_spooc.spawn[1].unit = "ZEAL_spooc"
	end

	if groups.marshal_squad then
		groups.marshal_squad.spawn_cooldown = 20
		groups.marshal_squad.initial_spawn_delay = nil
	end


	self.difficulty_curve_points[1] = math.lerp(0.5, 0.35, math.clamp(difficulty_index - 2, 0, 6) / 6)

	self.smoke_grenade_lifetime = 12
	self.smoke_and_flash_grenade_timeout = { 7, 10, }

	self.besiege.assault.build_duration = 5  -- seems a little pointless in modern pd2 tbh
	self.besiege.assault.delay = { 40, 30, 20, }
	self.besiege.assault.hostage_hesitation_delay = { 20, 15, 10, }

	-- self.besiege.assault.force = { 35, 40, 45, }
	self.besiege.assault.force = { 48, 56, 64, }
	self.besiege.assault.force_pool = { 250, 325, 400, }
	self.besiege.assault.sustain_duration_min = { 120, 180, 240, }
	self.besiege.assault.sustain_duration_max = self.besiege.assault.sustain_duration_min
	-- self.besiege.assault.sustain_duration_max = { 180, 300, 420, }

	local criminals = tweak_data.criminals and tweak_data.criminals.characters
	local max_characters = criminals and #criminals or #self.besiege.assault.force_balance_mul
	for i = 1, max_characters do
		self.besiege.assault.force_pool_balance_mul[i] = math.ceil(i / 4)  -- 1x with 1-4 players, 2x with 5-8, so on
		self.besiege.assault.sustain_duration_balance_mul[i] = self.besiege.assault.force_pool_balance_mul[i]
		self.besiege.assault.force_balance_mul[i] = (i * 0.2 + 0.2) * (ds and 1.5 or 1)  -- 0.4x with 1 player, + 0.2 for every additional player, all x1.5 on ds
	end

	self.besiege.recon.interval = { 0, 0, 0, }
	self.besiege.recon.interval_variation = 0
	self.besiege.recon.force = { 10, 10, 10, }

	self.besiege.reenforce.interval = { 20, 15, 10, }

	local function set_weights(new_weights)
		for task, new_groups in pairs(new_weights) do
			local groups = self.besiege[task].groups

			for group in pairs(groups) do
				groups[group] = { 0, 0, 0, }
			end

			for group, weights in pairs(new_groups) do
				groups[group] = weights
			end
		end
	end

	set_weights({
		assault = {
			swat_light = { 10, 5, 0, },
			swat_medium = { 5, 5, 5, },
			swat_heavy = { 0, 5, 10, },

			shield_light = { 1.25, 1.25, 0.2, },
			shield_medium = { 0, 1.25, 1.25, },
			shield_heavy = { 0, 0, 2.5, },

			taser_light = { 1.25, 1.25, 0.2, },
			taser_medium = { 0, 1.25, 1.25, },
			taser_heavy = { 0, 0, 2.5, },

			dozer_light = { 1.25, 1.25, 0.2, },
			dozer_medium = { 0, 1.25, 1.25, },
			dozer_heavy = { 0, 0, 2.5, },

			cloaker_light = { 1.25, 1.25, 0, },
			cloaker_medium = { 0, 1.25, 1.25, },
			cloaker_heavy = { 0, 0, 2.5, },

			recon_light = { 0, 0, 0, },
			recon_medium = { 0, 0, 0, },
			recon_heavy = { 0, 0, 0, },
			recon_cloaker = { 0, 0, 0, },
			recon_taser = { 0, 0, 0, },

			jerome = { 1.25, 1.25, 1.25, },

			good_game_design = { 1.25, 1.25, 1.25, },
		},
		recon = {
			recon_light = { 2, 1, 0, },
			recon_medium = { 1, 1, 1, },
			recon_heavy = { 0, 1, 2, },
			recon_cloaker = { 0.25, 0.25, 0.25, },
			recon_taser = { 0.25, 0.25, 0.25, },

			jerome = { 0, 0, 0, },

			good_game_design = { 0, 0, 0, },
		},
		reenforce = {
			reenforce_light = { 3, 2, 1, },
			reenforce_medium = { 1, 1, 1, },
			reenforce_heavy = { 1, 2, 3, },
		},
	})

	self.street = deep_clone(self.besiege)
	self.safehouse = deep_clone(self.besiege)
end )
