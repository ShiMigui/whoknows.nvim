local u = require('core.keymaps.utils')
local M = u.create_group()
local lsp = vim.lsp

M.run = { lhs = "<leader>cl", rhs = lsp.codelens.run, desc = "Run CodeLens" }
M.refresh = { lhs = "<leader>cr", rhs = lsp.codelens.refresh, desc = "Refresh CodeLens" }

return M
