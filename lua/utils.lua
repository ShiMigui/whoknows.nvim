local function notify(level)
	return function(message, ...)
		if select("#", ...) > 0 then
			message = message:format(...)
		elseif message:find("%%") then
			error("Format string provided without arguments")
		end
		vim.notify(message, level)
		return message
	end
end

return {
	invert_table = function(t)
		local set = {}
		for k, v in pairs(t) do
			set[v] = k
		end
		return set
	end,
	warn = notify(vim.log.levels.WARN),
	info = notify(vim.log.levels.INFO),
}
