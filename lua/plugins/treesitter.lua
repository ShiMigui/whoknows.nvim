return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function(_, opts)
		local ts = require("nvim-treesitter")
		ts.setup(opts)

		local install = require("nvim-treesitter.install")
		local installed = {}
		for i, v in ipairs(ts.get_installed()) do
			installed[v] = i
		end

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local buf = args.buf

				if vim.bo[buf].buftype ~= "" or vim.api.nvim_buf_get_name(buf) == "" then
					return
				end

				local ft = vim.treesitter.language.get_lang(args.match) or args.match
				if installed[ft] then
					return
				end
				install.install({ ft })
				installed[ft] = true
			end,
		})
	end,
}
