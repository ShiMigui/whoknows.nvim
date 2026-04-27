return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function(_, opts)
		local ts = require("nvim-treesitter")
		ts.setup(opts)

		local seen = {}
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local match = args.match
				if seen[match] then
					return
				end
				seen[match] = true

				local buf = args.buf
				local ft = vim.treesitter.language.get_lang(match)
				if not ft then
					return
				end

				local ok = pcall(vim.treesitter.get_parser, buf, ft)
				if not ok then
					local ok_install, err = pcall(ts.install, ft)
					if not ok_install then
						vim.notify(err, vim.log.levels.ERROR)
						return
					end
				end

				pcall(vim.treesitter.start, buf, ft)
			end,
		})
	end,
}
