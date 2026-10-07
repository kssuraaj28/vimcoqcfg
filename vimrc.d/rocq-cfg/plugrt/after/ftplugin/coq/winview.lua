---@diagnostic disable: unused-function
--@diagnostic disable: unused-local

-- A way to bypass Coqtail not updating buffer with no window
local hidden_floats = {}


-- Buffers that will be targeted by mirroring 
RocqGoalBuf = nil
RocqInfoBuf = nil

local function setup_mirroring()
  -- I don't exactly know why I do this..
  vim.cmd.RocqRestorePanels() -- Same as vim.cmd('RocqRestorePanels')

  local lcl = vim.api.nvim_get_current_buf()
  local panels = vim.b[lcl].coqtail_panel_bufs
  RocqGoalBuf, RocqInfoBuf = panels.goal, panels.info

  -- Clean up hidden floats
  for _, win in ipairs(hidden_floats) do
    local _, _ = pcall(vim.api.nvim_win_close,win, false)   -- true = force, discards unsaved changes in that buffer
    -- TODO: Handle these..
  end

  -- Make new hidden floats, so that Coqtail keeps updating them
  local w1 = vim.api.nvim_open_win(RocqGoalBuf, false, {relative='editor', row=0, col=0, width=80, height=5, hide=true})
  local w2 = vim.api.nvim_open_win(RocqInfoBuf, false, {relative='editor', row=0, col=0, width=80, height=5, hide=true})
  table.insert(hidden_floats, w1)
  table.insert(hidden_floats, w2)
  -- Use vim.api.nvim_list_wins to debug
end

-- n is normal mode
vim.keymap.set('n', '<leader><space>', setup_mirroring, { buffer = true, silent = true, desc = 'Setup mirroring' })
