---@alias VIM_MODE "n"|"v"|"i"|"r"|"t"
---@alias VIM_MODES VIM_MODE|VIM_MODE[]
---
---@class Mapping
---@field mode? VIM_MODES Mode(s) where the mapping applies
---@field lhs string Left-hand side (key sequence)
---@field rhs? string|function Right-hand side (command or Lua function)
---@field cmd? string Right-hand side (command)
---@field desc string Description used by tools like which-key
---@field opts? table Additional options passed to `vim.keymap.set`

return {
	lsp = require("keymaps.lsp"),
	core = require("keymaps.core"),
	terminal = require("keymaps.terminal"),
	codelens = require("keymaps.codelens"),
	workspace = require("keymaps.workspace"),
	diagnostic = require("keymaps.diagnostic"),

	---@type table<string, Mapping>
	custom = {},
}
