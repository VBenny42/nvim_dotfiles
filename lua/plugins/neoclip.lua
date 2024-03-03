return {
  'AckslD/nvim-neoclip.lua',
  dependencies = {
    'nvim-telescope/telescope.nvim'
  },
  enabled = false,
  keys = {
    { '<leader>tp', function() require('telescope').extensions.neoclip.default() end, desc = 'Open neoclip', silent = true }
  },
  config = function()
    require('neoclip').setup()
    pcall(require('telescope').load_extension, 'neoclip')
  end
}
