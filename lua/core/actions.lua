local diagnostic = vim.diagnostic
local buf = vim.lsp.buf
local lsp = vim.lsp
local M = {
  term = "<cmd>split|term<cr>",

	go_to_definition = buf.definition,
	go_to_declaration = buf.declaration,
	go_to_implementation = buf.implementation,
	go_to_type_definition = buf.type_definition,
	list_references = buf.references,

	hover = buf.hover,
	signature_help = buf.signature_help,

	rename_symbol = buf.rename,
	code_action = buf.code_action,

	add_workspace_folder = buf.add_workspace_folder,
	remove_workspace_folder = buf.remove_workspace_folder,
	list_workspace_folders = function()
		vim.print(buf.list_workspace_folders())
	end,
	workspace_symbol = buf.workspace_symbol,
	document_symbol = buf.document_symbol,

	line_diagnostics = diagnostic.open_float,
	diagnostic_prev = diagnostic.goto_prev,
	diagnostic_next = diagnostic.goto_next,
	diagnostics_loclist = diagnostic.setloclist,
	diagnostics_quickfix = diagnostic.setqflist,

	format = function()
		buf.format({ async = true })
	end,

	toggle_inlay_hints = function()
		lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled())
	end,

	run_codelens = lsp.codelens.run,
	refresh_codelens = lsp.codelens.refresh,

	hide_highlight = function()
    vim.cmd("nohlsearch")
	end,
}

---@alias VIM_MODES "n"|"v"|"i"|"r"

--- Creates a keymap using `vim.keymap.set`.
--- This is a small wrapper that automatically assigns the provided description to `opts.desc`
---
--- @param mode VIM_MODES|VIM_MODES[]
--- @param lhs string Left-hand side (key sequence).
--- @param rhs string|function Right-hand side of the mapping. Can be a command string or a Lua function.
--- @param desc string|nil Description of the keymap. Assigned to `opts.desc` for tools like which-key.
--- @param opts table|nil Additional options passed to `vim.keymap.set`.
function M.set(mode, lhs, rhs, desc, opts)
	opts = opts or {}
	opts.desc = desc
	vim.keymap.set(mode, lhs, rhs, opts)
end

return M
