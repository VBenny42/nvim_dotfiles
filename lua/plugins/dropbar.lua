return {
  'Bekaboo/dropbar.nvim',
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim'
  },
  enabled = true,
  config = function()
    vim.cmd('hi WinBar guibg=NONE')
  end
}
