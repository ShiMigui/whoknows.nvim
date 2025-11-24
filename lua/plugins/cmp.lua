vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", italic = true })

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
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
		local luasnip = require("luasnip")

		local function aux_fn(cmp_fn, jump)
			return function(fallback)
				if cmp.visible() then
					cmp[cmp_fn]()
				elseif luasnip.locally_jumpable(jump) then
					luasnip.jump(jump)
				else
					fallback()
				end
			end
		end

		require("luasnip.loaders.from_vscode").lazy_load()

		opts.snippet.expand = function(args)
			luasnip.lsp_expand(args.body)
		end
		opts.mapping = cmp.mapping.preset.insert({
			["<C-Space>"] = cmp.mapping.complete,
			["<CR>"] = cmp.mapping(function(fn)
				if not cmp.visible() then return fn() end
				if luasnip.expandable() then
					luasnip.expand()
				else
					cmp.confirm({select = true})
				end
			end),
			["<C-n>"] = cmp.mapping(aux_fn("select_next_item", 1), { "i", "s" }),
			["<C-p>"] = cmp.mapping(aux_fn("select_prev_item", -1), { "i", "s" }),
		})

		cmp.setup(opts)
	end,
}
