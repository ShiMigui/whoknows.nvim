local utils = require("utils")
local ignored_files = {
	"node_modules/",
	".git/",
	"dist/",
	"build/",
	"vendor/",
}

return {
	format_on_save = true,
	file_explorer = {
		ignore = ignored_files,
		inversed_ignore = utils.invert_table(ignored_files),
	},
}
