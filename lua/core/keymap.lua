local registered = {}
local SHOW_MODES_IN_KEYMAPS = false

local get_text = SHOW_MODES_IN_KEYMAPS
		and function(mode, desc, lhs)
			return { type(mode) == "table" and vim.inspect(mode) or '{ "' .. mode .. '" }', desc, lhs }
		end
	or function(_, desc, lhs)
		return { desc, lhs }
	end

vim.api.nvim_create_user_command("IWantToKnowCommands", function()
	for _, raw in ipairs(registered) do
		vim.notify(table.concat(get_text(unpack(raw)), " | "))
	end
end, {})

---@param mode string|string[]
---@param lhs string
---@param rhs string|function
---@param desc string
---@param buffer? integer|boolean
---@param opts? vim.keymap.set.Opts
return function(mode, lhs, rhs, desc, buffer, opts)
	opts = opts or {}
	if not desc or desc == "" then
		error("missing desc: I don't configure crap without a description")
	end
	if buffer ~= nil then
		opts.buffer = buffer
	end
	opts.desc = desc

	table.insert(registered, { mode, desc, lhs })
	vim.keymap.set(mode, lhs, rhs, opts)
end
