local ignored = require("settings").core.file_explorer.inversed_ignore

require("keymaps").ui.file_explorer.cmd = "lua MiniFiles.open()"
return {
	"nvim-mini/mini.files",
	version = "*",
	opts = {
		windows = { preview = true, width_preview = 40 },
		content = {
			filter = function(e)
				return not (e.fs_type == "directory" and ignored[e.name] or ignored[e.name .. "/"])
			end,
		},
	},
}
