local M = require("keymaps.utils").create_group()

M.toggle = { lhs = "<C-\\>", desc = "Toggle terminal" }
M.exit = { mode = "t", lhs = "<C-\\>", desc = "Exit terminal" }

return M
