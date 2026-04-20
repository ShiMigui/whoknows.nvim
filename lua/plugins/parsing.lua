local utils = require("utils")
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		local parsers = require("nvim-treesitter.parsers")

		local function callback(args)
			local buf = args.buf
			local ft = vim.treesitter.language.get_lang(args.match)

			if not ft or not parsers[ft] then
				return
			end

			local ok = pcall(vim.treesitter.get_parser, buf)

			if not ok then
				local ok_install, err = pcall(function()
					ts.install(ft)
				end)

				if not ok_install then
					return utils.warn("TS install failed for '%s': %s", ft, err)
				end
			end

			pcall(vim.treesitter.start, buf)
		end

		vim.api.nvim_create_autocmd("FileType", { callback = callback })
	end,
}
