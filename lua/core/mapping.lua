local diagnostic = vim.diagnostic
local lsp = vim.lsp
local buf = lsp.buf

---@alias VIM_MODE "n"|"v"|"i"|"r"|"t"
---@alias VIM_MODES VIM_MODE|VIM_MODE[]

---@class Mapping
---@field mode? VIM_MODES Mode(s) where the mapping applies
---@field lhs string Left-hand side (key sequence)
---@field rhs? string|function Right-hand side (command or Lua function)
---@field desc string Description used by tools like which-key
---@field opts? table Additional options passed to `vim.keymap.set`

---@type table<string, Mapping>
local global_maps = {}

---@param tbl table
---@param key string
---@param value Mapping
local function add_key(tbl, key, value)
	if not value.lhs or not value.desc then
		error("Mapping requires: lhs and desc")
	end
	value.mode = value.mode or "n"

	value.opts = value.opts or {}
	value.opts.desc = value.desc

	global_maps[key] = value
	rawset(tbl, key, global_maps[key])
end

local function create_group()
	return setmetatable({}, { __newindex = add_key })
end

local M = {
	ui = create_group(),
	lsp = create_group(),
	core = create_group(),
	custom = create_group(),
	codelens = create_group(),
	terminal = create_group(),
	workspace = create_group(),
	diagnostic = create_group(),
	list = global_maps,
}

M.core.close_buffer = { lhs = "<leader>q", rhs = "<cmd>bd<cr>", desc = "Close buffer" }
M.core.exit_insert = { mode = "i", lhs = "jk", rhs = "<Esc>", desc = "Exit insert mode" }
M.ui.clear_search = { lhs = "<leader>h", rhs = "<cmd>nohlsearch<cr>", desc = "Clear search highlight" }

M.ui.search = { lhs = "<C-f>", rhs = "/", desc = "Search" }
M.ui.replace_w = { lhs = "<C-h>", rhs = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]], desc = "Replace word" }
M.ui.replace_v = { mode = "v", lhs = "<C-h>", rhs = [[:s///g<Left><Left><Left>]], desc = "Replace in selection" }
M.ui.file_explorer = { lhs = "<leader>e", desc = "Open file explorer" }

M.lsp.definition = { lhs = "gd", rhs = buf.definition, desc = "Go to definition" }
M.lsp.declaration = { lhs = "gD", rhs = buf.declaration, desc = "Go to declaration" }
M.lsp.implementation = { lhs = "gi", rhs = buf.implementation, desc = "Go to implementation" }
M.lsp.type_definition = { lhs = "gt", rhs = buf.type_definition, desc = "Go to type definition" }
M.lsp.references = { lhs = "gr", rhs = buf.references, desc = "List references" }
M.lsp.hover = { lhs = "K", rhs = buf.hover, desc = "Hover documentation" }
M.lsp.signature = { mode = { "n", "i" }, lhs = "<C-k>", rhs = buf.signature_help, desc = "Signature help" }
M.lsp.rename = { lhs = "<leader>rn", rhs = buf.rename, desc = "Rename symbol" }
M.lsp.code_action = { mode = { "n", "v" }, lhs = "<leader>ca", rhs = buf.code_action, desc = "Code action" }
M.lsp.format = { mode = { "n", "v" }, lhs = "<leader>f", desc = "Format buffer" }
M.lsp.inlay_hints = { lhs = "<leader>th", desc = "Toggle inlay hints" }

function M.lsp.format.rhs()
	buf.format({ async = true })
end
function M.lsp.inlay_hints.rhs()
	lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled())
end

M.workspace.add = { lhs = "<leader>wa", rhs = buf.add_workspace_folder, desc = "Add workspace folder" }
M.workspace.remove = { lhs = "<leader>wr", rhs = buf.remove_workspace_folder, desc = "Remove workspace dir" }
M.workspace.symbol = { lhs = "<leader>ws", rhs = buf.workspace_symbol, desc = "Search workspace symbols" }
M.workspace.document_symbol = { lhs = "<leader>ds", rhs = buf.document_symbol, desc = "Search document symbols" }

M.diagnostic.toggle = { lhs = "gl", rhs = diagnostic.open_float, desc = "Line diagnostics" }
M.diagnostic.prev = { lhs = "[d", rhs = diagnostic.goto_prev, desc = "Previous diagnostic" }
M.diagnostic.next = { lhs = "]d", rhs = diagnostic.goto_next, desc = "Next diagnostic" }
M.diagnostic.loclist = { lhs = "<leader>dl", rhs = diagnostic.setloclist, desc = "Diagnostics to loclist" }
M.diagnostic.quickfix = { lhs = "<leader>dq", rhs = diagnostic.setqflist, desc = "Diagnostics to quickfix" }

M.codelens.run = { lhs = "<leader>cl", rhs = lsp.codelens.run, desc = "Run CodeLens" }
M.codelens.refresh = { lhs = "<leader>cr", rhs = lsp.codelens.refresh, desc = "Refresh CodeLens" }

M.terminal.toggle = { lhs = "<C-\\>", desc = "Toggle terminal" }
M.terminal.exit = { mode = "t", lhs = "<C-\\>", desc = "Exit terminal" }

return M
