local maps = require("core.keymap")
maps["open mini files"] = { lhs = "<C-e>", modes = { "n", "i" }, cmd = "lua MiniFiles.open()", esc = true }

local ignore = {}
for i, v in ipairs(require("config").ignore_files) do
	ignore[v] = true
end

return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.move").setup()
		require("mini.pairs").setup()
		require("mini.basics").setup()
		require("mini.comment").setup()

		require("mini.files").setup({
			windows = { preview = true, width_preview = 40 },
			content = {
				filter = function(e)
					local name = e.name
					if e.fs_type == "directory" then
						name = name .. "/"
					end
					return not ignore[name]
				end,
			},
		})
	end,
}
