vim.pack.add {
  'https://github.com/benomahony/uv.nvim',
  'https://github.com/linux-cultist/venv-selector.nvim',
}

require('uv').setup {
  picker_integration = true,
  auto_activate_venv = true,
  notify_activate_venv = true,
}
