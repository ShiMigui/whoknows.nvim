vim.diagnostic.config({
	signs = true,
	underline = true,
	severity_sort = true,
	update_in_insert = false,
	virtual_text = {
		spacing = 2,
		prefix = "●",
		severity = { min = vim.diagnostic.severity.WARN },
	},
	float = {
		border = "rounded",
		source = "if_many",
		focusable = false,
		style = "minimal",
	},
})

for type, icon in pairs({ Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.api.nvim_create_autocmd("CursorHold", { callback = vim.diagnostic.open_float })
