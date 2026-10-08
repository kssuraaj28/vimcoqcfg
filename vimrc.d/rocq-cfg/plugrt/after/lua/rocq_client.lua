-- Usage: require('rocq_client')
-- require cannot take arguments

local M = {}

-- TODO: Handle error when remote closes

local spawn = require('chill').spawn
local mirror = require('mirror').mirror_buf
local stop_mirror = require('mirror').stop_mirroring


local servername = nil
-- local servername = '/tmp/rocq.skt' -- TODO: This is hardcoded

local function mirror_coro(chill, is_goal)
  local rpcch = vim.fn.sockconnect("pipe", servername, { rpc = true })

  local function tgt_buf()
    local cmd = ('return %s'):format(is_goal and 'RocqGoalBuf' or 'RocqInfoBuf')
    while true do chill()
      local ok, ret = pcall(vim.rpcrequest,rpcch, 'nvim_exec_lua', cmd, {})
      if not ok then vim.cmd("qa!") end
      if ret ~= vim.NIL then return ret end
    end
  end

  local buf = tgt_buf()
  mirror(servername, buf)

  while true do chill()
    local newbuf = tgt_buf()
    if buf == newbuf then goto continue end
    buf = newbuf
    stop_mirror() -- Maybe the better interface is to return the buffer instead of switching to it.. TODO
    mirror(servername, buf)
  ::continue:: end
end


function M.set_remote(inp) servername = inp end
function M.mirror_goal() spawn(function (c) mirror_coro(c,true) end) end
function M.mirror_info() spawn(function (c) mirror_coro(c,false) end) end

return M
-- v: vars are vim's prededfined vars (servername, count, etc.)
