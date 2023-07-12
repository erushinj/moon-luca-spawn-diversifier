if not LSD then

	LSD = {
		mod_path = ModPath,
		required = {},
	}

	function LSD:get_difficulty()
		if not self._difficulty then
			self._difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		end

		return self._difficulty
	end

	function LSD:get_level_id()
		if not self._level_id then
			self._level_id = Global.level_data and Global.level_data.level_id or Global.game_settings and Global.game_settings.level_id
		end

		return self._level_id
	end

	Hooks:Add( "LocalizationManagerPostInit", "LocalizationManagerPostInitLucaSpawnDiversifier", function(loc)
		loc:add_localized_strings({
			lsd_menu_found_sh = "Luca's Spawn Diversifier is not made for Streamlined Heisting.\n\nLuca's Spawn Diversifier will deactivate itself until Streamlined Heisting is uninstalled and the game is fully restarted.",
			lsd_menu_warning = "Listen up",
			lsd_menu_ignore = "Get out of my face",
		})
	end )

	if StreamHeist then
		Hooks:Add( "MenuManagerOnOpenMenu", "MenuManagerOnOpenMenuLucaSpawnDiversifier", function()
			if Global.lsd_found_sh then
				return
			end

			Global.lsd_found_sh = true

			local message = managers.localization:text("lsd_menu_found_sh")
			local buttons = {
				{
					text = managers.localization:text("lsd_menu_ignore")
				}
			}
			QuickMenu:new(managers.localization:text("lsd_menu_warning"), message, buttons, true)
		end )
	end

	TheFixesPreventer = TheFixesPreventer or {}
	TheFixesPreventer.fix_gensec_shotgunner_in_murkywater = true

end

if Global.lsd_found_sh then
	return
end

-- hitscanner moment
if StreamHeist and BLT.Mods:GetModByName("Streamlined Heisting") then
	return
end

if ASS and ASS.been_there_fucked_that then
	return
end

-- final fallback
if StreamHeist then
	return
end

if RequiredScript and not LSD.required[RequiredScript] then

	local fname = LSD.mod_path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")
	if io.file_is_readable(fname) then
		dofile(fname)
	end

	LSD.required[RequiredScript] = true

end

LSD.been_there_smoked_that = true
