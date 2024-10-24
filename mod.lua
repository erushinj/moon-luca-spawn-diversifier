if not LSD then
	LSD = ModInstance
	LSD._require = {}
	LSD._lua_path = LSD:GetPath() .. "lua/"
	LSD.is_server = Network and Network:is_server() or false

	function LSD:require(file)
		if not self._require[file] then
			local path = self._lua_path .. file .. ".lua"

			self._require[file] = io.file_is_readable(path) and blt.vm.loadfile(path) or function() end
		end

		return self._require[file]()
	end

	TheFixesPreventer = TheFixesPreventer or {}
	TheFixesPreventer.crash_no_unit_type_aistatebesiege = true
end

if not LSD.is_server then
	return
end

if RequiredScript and not LSD._require[RequiredScript] then
	LSD:require((RequiredScript:gsub(".+/(.+)", "%1")))
end
