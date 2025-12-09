local keymap = require("configs.keymap")
vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", italic = true })

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		opts = { auto_install = true, highlight = { enable = true }, indent = { enable = true } },
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		lazy = false,
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"rafamadriz/friendly-snippets",
		},
		opts = {
			experimental = { ghost_text = { hl_group = "CmpGhostText" } },
			snippet = {},
			sources = {
				{ name = "luasnip" },
				{ name = "lazydev" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			},
		},
		config = function(_, opts)
			local cmp = require("cmp")
			local snip = require("luasnip")
			local function aux_fn(fn_name, jump_dir)
				return function(fallback)
					if cmp.visible() then
						return cmp[fn_name]()
					elseif snip.jumpable(jump_dir) then
						return snip.jump(jump_dir)
					end
					fallback()
				end
			end
			local modes = { "i", "s" }

			opts.snippet.expand = function(args)
				snip.lsp_expand(args.body)
			end
			opts.mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping(function(fn)
					if cmp.visible() then
						if snip.expandable() then
							return snip.expand()
						else
							return cmp.confirm({ select = true })
						end
					end
					fn()
				end),
				["<C-n>"] = cmp.mapping(aux_fn("select_next_item", 1), modes),
				["<C-p>"] = cmp.mapping(aux_fn("select_prev_item", -1), modes),
			})
			cmp.setup(opts)
		end,
	},
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
  },
}
