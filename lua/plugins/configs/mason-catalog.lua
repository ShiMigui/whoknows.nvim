return {
	silent = true,
	integrations = { "ensure_conform_formatters" },
	ensure_installed = { "java-debug-adapter", "java-test" },
	lsp = {
		default_config = { capabilities = require("cmp_nvim_lsp").default_capabilities() },
		by_group = {
			{ extensions = { "js", "ts", "jsx", "tsx" }, lsps = { "typescript-language-server", "eslint-lsp" } },
			{ extensions = { "json", "jsonc" }, lsps = { "json-lsp" } },
			{ extensions = { "md" }, lsps = { "marksman" } },
		},
		by_ft = {
			php = "intelephense",
			lua = "lua-language-server",
			dockerfile = "dockerfile-language-server",
			java = { jdtls = { cmd = { "jdtls", "-data", vim.fn.stdpath("cache") .. "/jdtls-workspace" } } },
			yaml = {
				["yaml-language-server"] = {
					settings = {
						yaml = {
							schemas = {
								["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
									"docker-compose.yml",
									"docker-compose.yaml",
									"compose.yml",
									"compose.yaml",
								},
							},
							validate = true,
							completion = true,
							hover = true,
						},
					},
				},
			},
		},
	},
}
