if not LSD then
	LSD = ModInstance
	LSD.required = {}

	function LSD:require(file)
		local path = self.path .. "lua/" .. file .. ".lua"

		return io.file_is_readable(path) and blt.vm.dofile(path)
	end

	TheFixesPreventer = TheFixesPreventer or {}
	TheFixesPreventer.crash_no_unit_type_aistatebesiege = true
	TheFixesPreventer.fix_hostages_not_moving = true
end

if RequiredScript and not LSD.required[RequiredScript] then
	LSD.required[RequiredScript] = true
	log(RequiredScript)
	LSD:require((RequiredScript:gsub(".+/(.+)", "%1")))
end
