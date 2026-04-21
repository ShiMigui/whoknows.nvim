local function notify(level)
	return function(message, ...)
		if select("#", ...) > 0 then
			message = message:format(...)
		end
		vim.notify(message, level)
	end
end

local M = {
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

---@param bind Mapping
function M.apply_bind(bind)
	if not bind.desc then
		return M.warn("Keymap for (%s) is missing desc", bind.lhs)
	end

	if not bind.rhs then
		if not bind.cmd then
			return M.warn("Keymap '%s' is missing rhs/cmd", bind.desc)
		end
		bind.rhs = "<CMD>" .. bind.cmd .. "<CR>"
	end

	bind.opts = bind.opts or {}
	bind.opts.desc = bind.desc

	vim.keymap.set(bind.mode or "n", bind.lhs, bind.rhs, bind.opts)
end
return M
