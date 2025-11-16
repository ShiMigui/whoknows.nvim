local TERM_ASPECT = 0.7

local new_floating = require('core.tools.floating_window').create

local state = {
  width_pc = TERM_ASPECT,
  height_pc = TERM_ASPECT,
  win = -1,
  buf = -1,
  job_id = nil,
}

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.win) or vim.api.nvim_win_get_config(state.win).hidden then
    state = new_floating(state)
    if vim.bo[state.buf].buftype ~= 'terminal' then vim.cmd.term() end
    state.job_id = vim.b[state.buf].terminal_job_id
    return
  end

  vim.api.nvim_win_hide(state.win)
end

vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
vim.keymap.set({'n', 'i', 't'}, '<LEADER>t', toggle_terminal)

vim.keymap.set_terminal_command = function(key, command)
  vim.keymap.set('t', key, function() vim.fn.chasend(state.job_id, command .. '\r\n') end)
end

vim.keymap.set_terminal_command('dcu', 'docker compose up')
