local api = vim.api
local M = {}

M.ensure_buf = function(buf) return (api.nvim_buf_is_valid(buf) and buf or api.nvim_create_buf(false, true)) end

M.calc_pct = function(total, pct) return math.floor(total * (pct or 0.8)) end

M.create = function(state)
  state = state or {}

  state.buf = M.ensure_buf(state.buf)

  local cols = vim.o.columns
  local rows = vim.o.lines

  local width = state.width or M.calc_pct(cols, state.width_pc)
  local height = state.height or M.calc_pct(rows, state.height_pc)

  if not state.config
    or state.config.width ~= width
    or state.config.height ~= height
    then
      state.config = {
        relative = "editor",
        width = width,
        height = height,
        col = math.floor((cols - width) / 2),
        row = math.floor((rows - height) / 2),
        style = "minimal",
        border = "rounded",
      }
    end

    if state.win and api.nvim_win_is_valid(state.win) then
      api.nvim_win_set_config(state.win, state.config)
      api.nvim_win_set_buf(state.win, state.buf)
      return state
    end

    state.win = api.nvim_open_win(state.buf, true, state.config)

    return state
  end

  return M
