local mapping = require("core.actions")
local ok, conform = pcall(require, "conform")
mapping.format = ok and conform.format or mapping.format

local prettier_fts = { "js", "jsx", "tsx", "css", "scss" }
local formatters_by_ft = {
	lua = { "stylua" },
	php = { "php_cs_fixer" },
}
for _, ft in ipairs(prettier_fts) do
	formatters_by_ft[ft] = { "prettier" }
end

return {
	"ShiMigui/mason-catalog.nvim",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
		},
		{ "stevearc/conform.nvim", opts = { formatters_by_ft = formatters_by_ft } },
		{ "neovim/nvim-lspconfig", event = { "BufReadPre", "BufNewFile" } },
	},
	opts = {
		lsp = {
			default_config = { capabilities = require("cmp_nvim_lsp").default_capabilities(), },
			by_group = {
				{
					extensions = { "js", "ts", "jsx", "tsx" },
					lsps = { "typescript-language-server", "eslint-lsp" },
				},
				{ filetypes = { "json", "jsonc" }, lsps = { "json-lsp" } },
				{ extensions = { "md" }, lsps = { "marksman" } },
			},
			by_ft = {
				lua = "lua-language-server",
				php = "intelephense",
			},
		},
		integrations = { "ensure_conform_formatters" },
		silent = true,
		debug = true,
	},
}
