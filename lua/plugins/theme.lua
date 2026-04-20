return {
	"rebelot/kanagawa.nvim",
	opts = {
		compile = true,
		undercurl = true,
		commentStyle = { italic = true },
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		functionStyle = {},
		typeStyle = {},
		transparent = false,
		dimInactive = false,
		terminalColors = true,
		colors = {
			theme = {
				all = {
					ui = {
						bg_gutter = "none",
					},
				},
			},
		},
		overrides = function(colors)
			local theme = colors.theme

			local sign = { bg = "none", fg = theme.ui.fg_dim }

			return {
				LineNr = sign,
				CursorLineNr = { fg = theme.syn.constant },
				CursorLine = { bg = theme.ui.bg_p1 },
			}
		end,
		theme = "dragon",
		background = {
			dark = "wave",
			light = "lotus",
		},
	},
	config = function(_, opts)
		local kana = require("kanagawa")
		kana.setup(opts)
		kana.load("wave")
		kana.compile()
	end,
}
