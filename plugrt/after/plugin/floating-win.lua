-- Here, we will create two floating windows
assert(not RocqInfowin)
RocqInfowin = vim.api.nvim_open_win(0, false, {relative='editor', row=0, col=0, width=80, height=5, hide=true})

assert(not RocqGoalwin)
RocqGoalwin = vim.api.nvim_open_win(0, false, {relative='editor', row=0, col=0, width=80, height=5, hide=true})

-- Use vim.api.nvim_win_set_buf(win, other_buf) to assign a buffer to these windows
