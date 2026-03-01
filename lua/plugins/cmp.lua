return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	opts = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local function smart_tab(next_item, snippet_action, snippet_check, modes)
			return cmp.mapping(function(fallback)
				if cmp.visible() then
					next_item()
				elseif snippet_check() then
					snippet_action()
				else
					fallback()
				end
			end, modes)
		end

		return {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Esc>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.close()
					else
						fallback()
					end
				end),
				["<Tab>"] = smart_tab(cmp.select_next_item, function()
					luasnip.expand_or_jump()
				end, function()
					return luasnip.expand_or_jumpable()
				end, { "i", "s" }),
				["<S-Tab>"] = smart_tab(cmp.select_prev_item, function()
					luasnip.jump(-1)
				end, function()
					return luasnip.jumpable(-1)
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),
			experimental = { ghost_text = { hl_group = "Comment" } },
		}
	end,
	config = function(_, opts)
		local cmp = require("cmp")
		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup(opts)
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
		})
	end,
}
