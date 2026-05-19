-- edgy.nvim: pin neo-tree, terminal and outline windows to fixed edges.

vim.pack.add { 'https://github.com/folke/edgy.nvim' }

vim.opt.laststatus = 3
vim.opt.splitkeep = 'screen'

require('edgy').setup {
  bottom = {
    {
      ft = 'toggleterm',
      size = { height = 0.4 },
      filter = function(_, win) return vim.api.nvim_win_get_config(win).relative == '' end,
    },
  },
  left = {
    {
      title = 'Neo-Tree',
      ft = 'neo-tree',
      filter = function(buf) return vim.b[buf].neo_tree_source == 'filesystem' end,
      size = { height = 0.5 },
    },
    {
      title = 'Neo-Tree Git',
      ft = 'neo-tree',
      filter = function(buf) return vim.b[buf].neo_tree_source == 'git_status' end,
      pinned = true,
      collapsed = true,
      open = 'Neotree position=right git_status',
    },
    {
      title = 'Neo-Tree Buffers',
      ft = 'neo-tree',
      filter = function(buf) return vim.b[buf].neo_tree_source == 'buffers' end,
      pinned = true,
      collapsed = false,
      open = 'Neotree position=top buffers',
    },
    {
      title = function()
        local buf_name = vim.api.nvim_buf_get_name(0) or '[No Name]'
        return vim.fn.fnamemodify(buf_name, ':t')
      end,
      ft = 'Outline',
      pinned = true,
      open = 'SymbolsOutlineOpen',
    },
  },
}
