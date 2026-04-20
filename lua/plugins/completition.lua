return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local map = cmp.mapping
		local cmd_line_preset = {
			mapping = map.preset.cmdline(),
			sources = { { name = "path" }, { name = "cmdline" } },
		}

		local function tab_behavior(next_item, expand, can_expand, modes)
			return map(function(fallback)
				if cmp.visible() then
					return next_item()
				elseif can_expand() then
					return expand()
				end
				fallback()
			end, modes)
		end

		local mappings = {
			["<C-Space>"] = map.complete(),
			["<CR>"] = map.confirm({ select = true }),
			["<Esc>"] = map.close(),
			["<Tab>"] = tab_behavior(
				cmp.select_next_item,
				luasnip.expand_or_jump,
				luasnip.expand_or_jumpable,
				{ "i", "s" }
			),
			["<S-Tab>"] = tab_behavior(cmp.select_prev_item, function()
				luasnip.jump(-1)
			end, function()
				return luasnip.jumpable(-1)
			end, { "i", "s" }),
		}

		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			mapping = map.preset.insert(mappings),
			experimental = { ghost_text = { hl_group = "Comment" } },
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "lazydev" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
		})
		cmp.setup.cmdline(":", cmd_line_preset)
	end,
}
