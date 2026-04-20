vim.g.mapleader = "\\"

require("settings.vim.opts")
require("manager")

local keymaps = require("keymaps")
local utils = require("utils")

---@param bind Mapping
local function apply_bind(bind)
	if not bind.desc then
		return utils.warn("Keymap for (%s) is missing desc", bind.lhs)
	end

	if not bind.rhs then
		if not bind.cmd then
			return utils.warn("Keymap '%s' is missing rhs/cmd", bind.desc)
		end
		bind.rhs = "<CMD>" .. bind.cmd .. "<CR>"
	end

	if not bind.opts then
		bind.opts = {}
	end
	bind.opts.desc = bind.desc

	vim.keymap.set(bind.mode or "n", bind.lhs, bind.rhs, bind.opts)
end

for _, map in pairs(keymaps) do
	for _, bind in pairs(map) do
		apply_bind(bind)
	end
end
