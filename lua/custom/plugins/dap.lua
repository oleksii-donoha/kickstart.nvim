-- Debugging stack: nvim-dap + UI + per-language adapters (Go, Python).
-- Replaces the previous standalone `lua/mydap.lua`.

vim.pack.add {
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/rcarriga/nvim-dap-ui',
  'https://github.com/theHamsta/nvim-dap-virtual-text',
  'https://github.com/leoluz/nvim-dap-go',
  'https://github.com/mfussenegger/nvim-dap-python',
}

local dap = require 'dap'
local dapui = require 'dapui'

dapui.setup()
require('nvim-dap-virtual-text').setup {}
require('dap-go').setup {}

-- Resolve debugpy from Mason's venv (installed via mason-tool-installer).
local mason_path = vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/')
require('dap-python').setup(mason_path .. 'packages/debugpy/venv/bin/python')

dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = 'DAP Continue' })
vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = 'DAP Step Over' })
vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = 'DAP Step Into' })
vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = 'DAP Step Out' })
vim.keymap.set('n', '<leader>qq', function() dap.toggle_breakpoint() end, { desc = 'DAP Toggle Breakpoint' })
vim.keymap.set('n', '<leader>Q', function() dap.set_breakpoint() end, { desc = 'DAP Set Breakpoint' })
vim.keymap.set('n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ') end, { desc = 'DAP Set Log Point' })
vim.keymap.set('n', '<leader>dr', function() dap.repl.open() end, { desc = 'DAP Open REPL' })
vim.keymap.set('n', '<leader>dl', function() dap.run_last() end, { desc = 'DAP Run Last' })
vim.keymap.set('n', '<leader>w', function() dapui.open() end, { desc = 'DAP UI Open' })
vim.keymap.set('n', '<leader>W', function() dapui.close() end, { desc = 'DAP UI Close' })
