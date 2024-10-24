Hooks:PostHook( WeaponTweakData, "init", "lsd_init", function(self)
	self.dmr_npc.CLIP_AMMO_MAX = 20
	self.heavy_snp_npc.CLIP_AMMO_MAX = 20
	self.ump_npc.CLIP_AMMO_MAX = 40
	self.mp5_tactical_npc.CLIP_AMMO_MAX = 40
	self.benelli_npc.sounds.prefix = "benelli_m4_npc"
	self.benelli_npc.CLIP_AMMO_MAX = 8
	self.ak47_npc.CLIP_AMMO_MAX = 35
	self.beretta92_npc.CLIP_AMMO_MAX = 15
	self.c45_npc.CLIP_AMMO_MAX = 15
	self.x_c45_npc.CLIP_AMMO_MAX = 30
end )
