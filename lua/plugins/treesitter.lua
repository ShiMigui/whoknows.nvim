return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		local installed = {}
		for _, v in ipairs(ts.get_installed()) do
			installed[v] = true
		end

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local buf = args.buf
				local ft = vim.treesitter.language.get_lang(args.match)

				if vim.bo[buf].buftype ~= "" or installed[ft] then
					return
				end

				pcall(function()
					ts.install(ft)
					vim.treesitter.start()
					installed[ft] = true
				end)
			end,
		})
	end,
}
