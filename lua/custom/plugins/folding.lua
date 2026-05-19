-- nvim-ufo: treesitter-backed folds, with statuscol providing the fold column.

vim.pack.add {
  'https://github.com/kevinhwang91/promise-async',
  'https://github.com/kevinhwang91/nvim-ufo',
  'https://github.com/luukvbaal/statuscol.nvim',
}

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99 -- ufo expects a high value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

require('ufo').setup {
  provider_selector = function(_, _, _) return { 'treesitter', 'indent' } end,
}

local builtin = require 'statuscol.builtin'
require('statuscol').setup {
  setopt = true,
  segments = {
    { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
    { text = { '%s' }, click = 'v:lua.ScSa' },
    {
      text = { builtin.lnumfunc, ' ' },
      condition = { true, builtin.not_empty },
      click = 'v:lua.ScLa',
    },
  },
}
