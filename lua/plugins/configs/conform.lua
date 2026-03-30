local format_map = require("core.mapping").lsp.format

return function()
	local opts = {
		default_format_opts = { lsp_format = "fallback" },
		formatters_by_ft = {
			lua = { "stylua" },
			php = { "php_cs_fixer" },
			java = { "google-java-format" },
		},
	}

	for _, ft in ipairs({ "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "scss", "markdown" }) do
		opts.formatters_by_ft[ft] = { "prettier" }
	end

	local cfm = require("conform")
	cfm.setup(opts)
	format_map.rhs = cfm.format
end
