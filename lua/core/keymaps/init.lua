local list = require("core.keymaps.utils").list

local function apply()
	local lvl = vim.log.levels.WARN
	for _, map in ipairs(list) do
		if map.rhs then
			vim.keymap.set(map.mode, map.lhs, map.rhs, map.opts)
		else
			vim.notify(("Keymap '%s' (%s) is missing rhs"):format(map.desc, map.lhs), lvl)
			vim.print(map.rhs)
		end
	end
end

return {
	apply = apply,
	ui = require("core.keymaps.ui"),
	lsp = require("core.keymaps.lsp"),
	core = require("core.keymaps.core"),
	terminal = require("core.keymaps.terminal"),
	codelens = require("core.keymaps.codelens"),
	workspace = require("core.keymaps.workspace"),
	diagnostic = require("core.keymaps.diagnostic"),
}
