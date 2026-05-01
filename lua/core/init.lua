require("core.manager").setup("plugins")
require("core.vim.opts")
require("core.vim.diagnostic")

-- must run AFTER plugins manager
local bind = require("core.keymap.bind")
local maps = require("core.keymap")
for desc, map in pairs(maps) do
	bind(desc, map)
end
