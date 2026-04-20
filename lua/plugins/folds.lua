return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	opts = {
		provider_selector = function()
			return { "treesitter", "indent" }
		end,
		close_fold_kinds_for_ft = {
			default = { "imports", "comment" },
		},
		preview = { win_config = { border = "rounded", winblend = 10 } },
	},
	config = function(_, opts)
		local ufo = require("ufo")
		ufo.setup(opts)

		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.o.foldcolumn = "0"

		vim.keymap.set("n", "z<space>", ufo.openAllFolds)
		vim.keymap.set("n", "zz", ufo.closeAllFolds)
		vim.keymap.set("n", "Z", function()
			local winid = ufo.peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end)
	end,
}
