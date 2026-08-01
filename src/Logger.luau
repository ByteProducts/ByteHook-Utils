local VIRTUALIZE_LOADSTRING = loadstring([[
    function LPH_NO_VIRTUALIZE(f) return f end;
]])
VIRTUALIZE_LOADSTRING()

return LPH_NO_VIRTUALIZE(function()
	local Logger = {
		Name = "Project ByteHook",
		Debug = false,
	}

	function Logger.Print(...): ()
		print(`[{Logger.Name}]: {...}`)
	end

	function Logger.Warn(...): ()
		warn(`[{Logger.Name}]: {...}`)
	end

	function Logger.Error(...): ()
		error(`[{Logger.Name}]: {...}`)
	end

	function Logger.DebugPrint(...): ()
		print(`[{Logger.Name}{Logger.Debug and " [DEBUG]"}]: {...}`)
	end

	return Logger
end)()
