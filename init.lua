vim.g.mapleader = "\\"

vim.diagnostic.config({
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})

require("core.opts")
require("core.lazy")

local mapping = require("core.actions")
local map = mapping.set
map("i", "jk", "<Esc>", "Exit insert mode")
map("n", "<leader>li", "<cmd>LspInfo<CR>", "LSP: Info")
map("n", "<leader>lr", "<cmd>LspRestart<CR>", "LSP: Restart")
-- map("n", "<leader>ls", "<cmd>LspStart<CR>", "LSP: Start")
-- map("n", "<leader>lS", "<cmd>LspStop<CR>", "LSP: Stop")

map("n", "<leader>h", mapping.toggle_highlight, "Toggle search highlight")

map("n", "gd", mapping.go_to_definition, "LSP: Go to definition")
map("n", "gD", mapping.go_to_declaration, "LSP: Go to declaration")
map("n", "gi", mapping.go_to_implementation, "LSP: Go to implementation")
map("n", "gt", mapping.go_to_type_definition, "LSP: Go to type definition")
map("n", "gr", mapping.list_references, "LSP: List references")

map("n", "K", mapping.hover, "LSP: Hover documentation")
map({ "n", "i" }, "<C-k>", mapping.signature_help, "LSP: Signature help")

map("n", "<leader>rn", mapping.rename_symbol, "LSP: Rename symbol")
map({ "n", "v" }, "<leader>ca", mapping.code_action, "LSP: Code action")

map("n", "<leader>wa", mapping.add_workspace_folder, "LSP: Add workspace folder")
map("n", "<leader>wr", mapping.remove_workspace_folder, "LSP: Remove workspace folder")
map("n", "<leader>wl", mapping.list_workspace_folders, "LSP: List workspace folders")

map("n", "<leader>ws", mapping.workspace_symbol, "LSP: Search workspace symbols")
map("n", "<leader>ds", mapping.document_symbol, "LSP: Search document symbols")

map("n", "gl", mapping.line_diagnostics, "LSP: Line diagnostics")
map("n", "[d", mapping.diagnostic_prev, "LSP: Previous diagnostic")
map("n", "]d", mapping.diagnostic_next, "LSP: Next diagnostic")
map("n", "<leader>dl", mapping.diagnostics_loclist, "LSP: Diagnostics to loclist")
map("n", "<leader>dq", mapping.diagnostics_quickfix, "LSP: Diagnostics to quickfix")

map({ "n", "v" }, "<leader>f", mapping.format, "LSP: Format")

map("n", "<leader>th", mapping.toggle_inlay_hints, "LSP: Toggle inlay hints")

map("n", "<leader>cl", mapping.run_codelens, "LSP: Run CodeLens")
map("n", "<leader>cr", mapping.refresh_codelens, "LSP: Refresh CodeLens")
