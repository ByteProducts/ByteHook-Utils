local VIRTUALIZE_LOADSTRING = loadstring([[
    function LPH_NO_VIRTUALIZE(f) return f end;
]])
VIRTUALIZE_LOADSTRING()

return LPH_NO_VIRTUALIZE(function()
	-- Profile code time
	-- Determine what parts of our script are lagging us through the microprofiler
	local Profiler = {}

	-- Runs a function with a specified profiler label
	-- TODO: fix this breaking on yielding functions
	function Profiler.Run(label: string, functionToProfile, ...: any): any
		local isOkayToRun = getgenv()
			and typeof(getgenv().ByteHook) == "table"
			and not getgenv().ByteHook.Silent

		if isOkayToRun then
			debug.profilebegin(label)
		end

		-- Run with pcall to ensure debug.profileend always executes if an error occurs
		local success, ret_values = pcall(function(...)
			return table.pack(functionToProfile(...))
		end, ...)

		if isOkayToRun then
			debug.profileend()
		end

		if not success then
			error(ret_values, 2) -- Re-throw the error outside the profile scope
		end

		return table.unpack(ret_values, 1, ret_values.n)
	end

	-- Wrap function in a profiler statement with a label
	function Profiler.Wrap(label: string, functionToProfile)
		return function(...: any): any
			return Profiler.Run(label, functionToProfile, ...)
		end
	end

	-- Return profiler module
	return Profiler
end)()
