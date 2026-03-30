vim.g.mapleader = "\\"

vim.diagnostic.config({
	signs = true,
	underline = true,
	virtual_text = true,
	severity_sort = true,
	update_in_insert = true,
})

require("core.opts")
require("core.lazy")
