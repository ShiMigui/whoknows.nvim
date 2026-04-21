vim.g.mapleader = "\\"

require("settings.vim.opts")
require("settings.vim.diagnostic")
require("manager")

local apply = require("utils").apply_bind
for _, map in pairs(require("keymaps")) do
	for _, bind in pairs(map) do
		apply(bind)
	end
end
