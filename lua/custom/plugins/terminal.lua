-- toggleterm + a floating lazygit, exposed as :Git (and <leader>gg in Section 1).

vim.pack.add {
  { src = 'https://github.com/akinsho/toggleterm.nvim', version = vim.version.range '*' },
  'https://github.com/voldikss/vim-floaterm',
}

require('toggleterm').setup {}
vim.keymap.set('n', '<leader>tt', function() require('toggleterm').toggle() end, { desc = 'Toggle [T]erminal' })

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new {
  cmd = 'lazygit',
  hidden = true,
  direction = 'float',
  float_opts = { border = 'double' },
}

local function lazygit_toggle() lazygit:toggle() end
vim.api.nvim_create_user_command('Git', function() lazygit_toggle() end, { desc = 'Lazygit in a floating window' })
