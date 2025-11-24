---@param mode string|string[]
---@param lhs string
---@param rhs string|function
---@param desc string
---@param buffer? integer|boolean
---@param opts? vim.keymap.set.Opts
return function(mode, lhs, rhs, desc, buffer, opts)
	opts = opts or {}
	if not desc or desc == "" then error("missing desc: I don't configure crap without a description") end
	if buffer ~= nil then opts.buffer = buffer end
	opts.desc = desc
	vim.keymap.set(mode, lhs, rhs, opts)
end
