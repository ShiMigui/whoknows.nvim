local u = require("core.keymaps.utils")
local M = u.create_group()

M.file_explorer = { lhs = "<leader>e", rhs = "<cmd>Explore<cr>", desc = "Open file explorer" }

return M
