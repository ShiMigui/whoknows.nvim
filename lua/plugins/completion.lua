return {
	{
		"stevearc/conform.nvim",
		opts = {
			default_format_opts = { lsp_format = "fallback" },
			formatters_by_ft = { lua = { "stylua" } },
			format_on_save = { timeout_ms = 500 },
		},
	},
	{
		"saghen/blink.cmp",
		dependencies = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
		version = "1.*",
		build = "cargo build --release",
		opts = {
			fuzzy = { implementation = "prefer_rust", sorts = { "score", "sort_text", "label" } },
			keymap = {
				preset = "default",
				["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<CR>"] = { "accept", "fallback" },
			},
			completion = { menu = { auto_show = true }, documentation = { auto_show = false } },
			sources = { default = { "lsp", "snippets", "buffer", "path" } },
			snippets = { preset = "luasnip" },
		},
	},
	{
		"ShiMigui/catalog.nvim",
		dependencies = { { "williamboman/mason.nvim", opts = {} }, "neovim/nvim-lspconfig" },
		opts = {
			conform = true,
			lsp_config = {},
			lsp_capability_provider = "blink.cmp",
			lsp = { lua = "lua-language-server" },
		},
		config = function(_, opts)
			local r = require("mason-registry") -- It's needed since Mason registry should not be cached yet
			local function run()
				require("catalog").setup(opts)
			end

			return #r.get_all_packages() > 0 and run() or r.refresh(run)
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
	},
}
