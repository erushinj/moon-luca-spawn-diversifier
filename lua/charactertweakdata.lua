Hooks:PostHook( CharacterTweakData, "_create_table_structure", "lsd__create_table_structure", function(self)
	self.weap_map = {}

	if self.weap_ids and self.weap_unit_names then
		for i = 1, #self.weap_ids do
			self.weap_map[self.weap_ids[i]] = self.weap_unit_names[i]
		end
	end
end )

Hooks:PostHook( CharacterTweakData, "init", "lsd_init", function(self)
	self.marshal_marksman.misses_first_player_shot = false

	-- Restore special entrance announcements
	self.tank.spawn_sound_event = self.tank.speech_prefix_p1 .. "_entrance"
	self.tank_hw.spawn_sound_event = self.tank_hw.speech_prefix_p1 .. "_entrance"
	self.tank_medic.spawn_sound_event = self.tank_medic.speech_prefix_p1 .. "_entrance"
	self.tank_mini.spawn_sound_event = self.tank_mini.speech_prefix_p1 .. "_entrance"
	self.taser.spawn_sound_event = self.taser.speech_prefix_p1 .. "_entrance"

	-- Fix/tweak suppression settings
	self.fbi.suppression = self.presets.suppression.easy
	self.gensec.suppression = self.presets.suppression.easy
	self.swat.suppression = self.presets.suppression.hard_def
	self.zeal_swat.suppression = self.presets.suppression.hard_def
	self.heavy_swat_sniper.suppression = self.presets.suppression.hard_agg
end )

Hooks:PostHook( CharacterTweakData, "_presets", "lsd__presets", function(self)
	local presets = Hooks:GetReturn()

	-- Tweak dodge presets
	presets.dodge.heavy.occasions.preemptive.chance = 0.25
	presets.dodge.athletic.occasions.preemptive.chance = 0.5

	presets.dodge.ninja.speed = 2
	for _, occasion in pairs(presets.dodge.ninja.occasions) do
		occasion.chance = 1
		if occasion.variations.side_step then
			occasion.variations.side_step.chance = 1
		end
	end

	return presets
end )
