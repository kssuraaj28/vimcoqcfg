assert(RocqGoalwin)
assert(RocqInfowin)

function Test()
  vim.cmd.RocqRestorePanels() -- Same as vim.cmd('RocqRestorePanels')
  -- Maybe you can vim.fn(coqtail#open_and_refresh) also
  local lcl = vim.api.nvim_get_current_buf()
  local panels = vim.b[lcl].coqtail_panel_bufs
  local goal, info = panels.goal, panels.info
  vim.api.nvim_win_set_buf(RocqGoalwin, goal)
  vim.api.nvim_win_set_buf(RocqInfowin, info)
end

Test()
