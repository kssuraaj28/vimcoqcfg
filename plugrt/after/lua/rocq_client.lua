-- Usage: require('rocq_client')
-- require cannot take arguments

local M = {}

local servername = '/tmp/rocq.skt'

local spawn = require('chill').spawn
local mirror = require('mirror').mirror_buf
local stop_mirror = require('mirror').stop_mirroring


local function test(chill)
  local rpcch = vim.fn.sockconnect("pipe", servername, { rpc = true })
  local buf =  vim.rpcrequest(rpcch, 'nvim_exec_lua', 'return RocqGoalBuf', {})
  mirror(servername, buf)
  local x = 0
  while x < 10000 do
    print(x)
    x = x + 1
    chill ()
  end
  stop_mirror()

end

function M.test()
  spawn(test)
end


return M


-- v: vars are vim's prededfined vars (servername, count, etc.)
