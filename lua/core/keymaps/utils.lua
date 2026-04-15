---@alias VIM_MODE "n"|"v"|"i"|"r"|"t"
---@alias VIM_MODES VIM_MODE|VIM_MODE[]
---@class Mapping
---@field mode? VIM_MODES Mode(s) where the mapping applies
---@field lhs string Left-hand side (key sequence)
---@field rhs? string|function Right-hand side (command or Lua function)
---@field desc string Description used by tools like which-key
---@field opts? table Additional options passed to `vim.keymap.set`

---@type table<string, Mapping>
local global_maps = {}

---@param tbl table
---@param key string
---@param value Mapping
local function add_key(tbl, key, value)
	value.mode = value.mode or "n"

	value.opts = value.opts or {}
	value.opts.desc = value.desc

	if not value.lhs or not value.desc then
		error("Mapping requires: lhs and desc")
	end
	rawset(tbl, key, value)
	table.insert(global_maps, value)
end

local metatable_opts = { __newindex = add_key }
local function create_group()
	return setmetatable({}, metatable_opts)
end

---@type {
---create_group: fun(),
---list: Mapping[],
---}
return {
	create_group = create_group,
	list = global_maps,
}
