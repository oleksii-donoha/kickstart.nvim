local dap, dapui = require 'dap', require 'dapui'
local dapgo = require 'dap-go'
dapui.setup()
dapgo.setup()
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end

-- Include the next few lines until the comment only if you feel you need it
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
-- Include everything after this

vim.keymap.set('n', '<F5>', function()
  require('dap').continue()
end, { desc = 'DAP Continue' })
vim.keymap.set('n', '<F10>', function()
  require('dap').step_over()
end, { desc = 'DAP Step Over' })
vim.keymap.set('n', '<F11>', function()
  require('dap').step_into()
end, { desc = 'DAP Step Into' })
vim.keymap.set('n', '<F12>', function()
  require('dap').step_out()
end, { desc = 'DAP Step Out' })
vim.keymap.set('n', '<Leader>qq', function()
  require('dap').toggle_breakpoint()
end, { desc = 'DAP Toggle Breakpoint' })
vim.keymap.set('n', '<Leader>Q', function()
  require('dap').set_breakpoint()
end, { desc = 'DAP Set Breakpoint' })
vim.keymap.set('n', '<Leader>lp', function()
  require('dap').set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
end, { desc = 'DAP Set Log Point' })
vim.keymap.set('n', '<Leader>dr', function()
  require('dap').repl.open()
end, { desc = 'DAP Open REPL' })
vim.keymap.set('n', '<Leader>dl', function()
  require('dap').run_last()
end, { desc = 'DAP Run Last' })

vim.keymap.set('n', '<Leader>w', function()
  dapui.open()
end, { desc = 'DAP UI Open' })
vim.keymap.set('n', '<Leader>W', function()
  dapui.close()
end, { desc = 'DAP UI Close' })
