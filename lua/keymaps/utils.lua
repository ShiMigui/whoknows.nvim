---@alias VIM_MODE "n"|"v"|"i"|"r"|"t"
---@alias VIM_MODES VIM_MODE|VIM_MODE[]
---@class Mapping
---@field mode? VIM_MODES Mode(s) where the mapping applies
---@field lhs string Left-hand side (key sequence)
---@field rhs? string|function Right-hand side (command or Lua function)
---@field desc string Description used by tools like which-key
---@field opts? table Additional options passed to `vim.keymap.set`

---@type Mapping[]
local maps = {}

---@param tbl table
---@param key string
---@param value Mapping
local function set(tbl, key, value)
	value.mode = value.mode or "n"

	value.opts = value.opts or {}
	value.opts.desc = value.desc

	local lhs = value.lhs
	if not lhs or not value.desc then
		error("Mapping requires: lhs and desc")
	end

	rawset(tbl, key, value)
	table.insert(maps, value)
end

local metatable_opts = { __newindex = set }

return {
	create_group = function()
		return setmetatable({}, metatable_opts)
	end,
	apply = function()
		local lvl = vim.log.levels.WARN
		for _, map in ipairs(maps) do
			if map.rhs then
				vim.keymap.set(map.mode, map.lhs, map.rhs, map.opts)
			else
				vim.notify(("Keymap '%s' (%s) is missing rhs"):format(map.desc, map.lhs), lvl)
			end
		end
	end,
}
