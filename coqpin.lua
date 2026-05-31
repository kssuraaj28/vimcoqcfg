local M = {}
local state = {}  -- bufnr -> { row = screen_row, attached = bool }

local function find_sep(bufnr)
  for i, l in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
    if l:find("==") then return i end
  end
end

local function restore(bufnr)
  local s = state[bufnr]; if not s then return end
  local sep = find_sep(bufnr); if not sep then return end
  for _, win in ipairs(vim.fn.win_findbuf(bufnr)) do
    local top = math.max(1, sep - s.row + 1)
    vim.api.nvim_win_call(win, function()
      vim.fn.winrestview({ topline = top, lnum = sep, col = 0 })
    end)
  end
end

local function attach(bufnr)
  vim.api.nvim_buf_attach(bufnr, false, {
    on_lines = function()
      if not state[bufnr] then return true end
      vim.schedule(function() restore(bufnr) end)
    end,
    on_detach = function()
      if state[bufnr] then state[bufnr].attached = false end
    end,
  })
end

function M.pin()
  local bufnr = vim.api.nvim_get_current_buf()
  local sep = find_sep(bufnr)
  if not sep then
    vim.notify("CoqPin: no ======= line in buffer", vim.log.levels.WARN); return
  end
  local row = sep - vim.fn.line('w0') + 1
  local s = state[bufnr] or {}
  s.row = row
  state[bufnr] = s
  if not s.attached then s.attached = true; attach(bufnr) end
  vim.notify(("CoqPin: ======= pinned at screen row %d"):format(row))
end

function M.unpin()
  state[vim.api.nvim_get_current_buf()] = nil
end

vim.api.nvim_create_user_command("CoqPin", M.pin, {})
vim.api.nvim_create_user_command("CoqUnpin", M.unpin, {})

return M
