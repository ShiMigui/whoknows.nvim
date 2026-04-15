return {
	"rebelot/kanagawa.nvim",
	opts = {
		compile = false,
		undercurl = true,

		commentStyle = { italic = true },
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		functionStyle = { bold = true },
		typeStyle = { italic = true },

		transparent = true,
		dimInactive = true,
		terminalColors = true,

		colors = {
			palette = {},
			theme = {
				all = {
					ui = {
						bg_gutter = "none",
						bg_m3 = "none",
					},
				},
			},
		},

		overrides = function(colors)
			local theme = colors.theme

			return {
				-- Cursor line mais visível
				CursorLine = { bg = theme.ui.bg_p1 },

				-- Linha de número mais clean
				LineNr = { fg = theme.ui.fg_dim },
				CursorLineNr = { fg = colors.palette.dragonYellow, bold = true },

				-- Visual selection mais elegante
				Visual = { bg = theme.ui.bg_visual },

				-- Comentários mais apagados (menos poluição mental)
				Comment = { fg = theme.ui.fg_dim, italic = true },

				-- Funções mais destacadas
				Function = { fg = colors.palette.dragonBlue, bold = true },

				-- Keywords com mais presença
				Keyword = { fg = colors.palette.dragonPink, italic = true },

				-- Strings suaves
				String = { fg = colors.palette.dragonGreen },

				-- Diagnostics menos gritantes
				DiagnosticVirtualTextError = { bg = "none", fg = colors.palette.samuraiRed },
				DiagnosticVirtualTextWarn = { bg = "none", fg = colors.palette.roninYellow },

				-- Popup menu
				Pmenu = { bg = theme.ui.bg_m1 },
				PmenuSel = { bg = theme.ui.bg_p1, bold = true },

				-- Telescope (porque você vai usar, querendo ou não)
				TelescopeTitle = { fg = colors.palette.dragonBlue, bold = true },
				TelescopeSelection = { bg = theme.ui.bg_p1 },

				-- Float windows mais elegantes
				NormalFloat = { bg = theme.ui.bg_m1 },
				FloatBorder = { fg = theme.ui.fg_border },
			}
		end,

		theme = "dragon",
	},

	config = function()
		vim.cmd.colorscheme("kanagawa")
	end,
}
