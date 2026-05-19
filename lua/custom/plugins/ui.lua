-- Lualine, blame line, todo signs, treesitter-context: small UI niceties.

vim.pack.add {
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/tveskag/nvim-blame-line',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
}

require('lualine').setup {
  options = {
    icons_enabled = vim.g.have_nerd_font,
    theme = 'tokyonight',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
}

require('treesitter-context').setup {}

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Enable blame line on buffer enter',
  callback = function() vim.cmd 'EnableBlameLine' end,
})
