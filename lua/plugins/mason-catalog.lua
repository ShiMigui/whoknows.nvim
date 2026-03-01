local ts = "typescript-language-server"
local mapping = require("core.actions")
local list = {}

return {
	{
		"stevearc/conform.nvim",
		opts = { formatters_by_ft = require("configs.formatters_by_ft") },
		config = function(_, opts)
			local cfm = require("conform")
			cfm.setup(opts)
			mapping.format = cfm.format
			for _, f in ipairs(cfm.list_all_formatters()) do
				list[#list + 1] = f.name
			end
		end,
	},
	{
		"ShiMigui/mason-catalog.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
			},
			{ "neovim/nvim-lspconfig", event = { "BufReadPre", "BufNewFile" } },
		},
		opts = {
			lsp = {
				default_config = { capabilities = require("cmp_nvim_lsp").default_capabilities() },
				by_ft = {
					lua = "lua-language-server",
					javascriptsx = {ts},
					tsx = ts,
					javascript = ts,
					typescript = ts,
				},
				auto_enable = true,
			},
			ensure_installed = list,
		},
		config = function(_, opts)
			require("mason").setup()
			local registry = require("mason-registry")

			local function setup()
				require("mason-catalog").setup(opts)
			end

			if #registry.get_all_packages() == 0 then
				registry.refresh(setup)
			else
				setup()
			end
		end,
	},
}
