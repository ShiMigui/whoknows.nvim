local jdtls = require("jdtls")
local home = os.getenv("HOME")

local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" })
if not root_dir then
	return
end

local project_name = vim.fn.fnamemodify(root_dir, ":t")
local workspace = home .. "/.cache/jdtls/" .. project_name

jdtls.start_or_attach({
	cmd = { "jdtls" },
	root_dir = root_dir,
	workspace_folder = workspace,
})
