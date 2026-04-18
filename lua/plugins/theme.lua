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

		-- overrides = function(colors)
		-- 	local theme = colors.theme
		--
		-- 	return {
		-- 		-- CursorLine = { bg = theme.ui.bg_p1 },
		--
		-- 		LineNr = { fg = theme.ui.fg_dim },
		-- 		CursorLineNr = { fg = colors.palette.dragonYellow, bold = true },
		--
		-- 		Visual = { bg = theme.ui.bg_visual },
		--
		-- 		Comment = { fg = theme.ui.fg_dim, italic = true },
		--
		-- 		Function = { fg = colors.palette.dragonBlue, bold = true },
		--
		-- 		Keyword = { fg = colors.palette.dragonPink, italic = true },
		--
		-- 		String = { fg = colors.palette.dragonGreen },
		--
		-- 		DiagnosticVirtualTextError = { bg = "none", fg = colors.palette.samuraiRed },
		-- 		DiagnosticVirtualTextWarn = { bg = "none", fg = colors.palette.roninYellow },
		--
		-- 		Pmenu = { bg = theme.ui.bg_m1 },
		-- 		PmenuSel = { bg = theme.ui.bg_p1, bold = true },
		--
		-- 		TelescopeTitle = { fg = colors.palette.dragonBlue, bold = true },
		-- 		TelescopeSelection = { bg = theme.ui.bg_p1 },
		--
		-- 		NormalFloat = { bg = theme.ui.bg_m1 },
		-- 		FloatBorder = { fg = theme.ui.fg_border },
		-- 	}
		-- end,

		theme = "dragon",
	},

	config = function(_, opts)
		require("kanagawa").setup(opts)
		vim.cmd("KanagawaCompile")
		vim.cmd.colorscheme("kanagawa")
	end,
}
