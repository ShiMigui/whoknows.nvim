local u = require('core.keymaps.utils')
local M = u.create_group()

M.toggle = { lhs = "<C-\\>", desc = "Toggle terminal" }
M.exit = { mode = "t", lhs = "<C-\\>", desc = "Exit terminal" }

return M
