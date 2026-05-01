---normalizes a keymap
---@param desc string
---@param map Mapping
return function(desc, map)
	if not map.rhs then
		map.rhs = map.esc and "<esc>" or ""
		if map.cmd then
			map.rhs = map.rhs .. "<cmd>" .. map.cmd .. "<cr>"
		end

		if map.rhs == "" then
			print("Keymap has no command or function related! keymap desc = " .. desc)
			return
		end
	end

	if not map.lhs then
		map.lhs = map.leader and ("<leader>" .. map.leader)

		if not map.lhs then
			print("Keymap has no bind related! keymap desc = " .. desc)
			return
		end
	end

	map.opts = map.opts or {}
	vim.tbl_deep_extend("force", map.opts, { desc = desc })
	vim.keymap.set(map.modes or "n", map.lhs, map.rhs, map.opts)
end
