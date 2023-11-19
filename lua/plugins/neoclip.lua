return {
  'AckslD/nvim-neoclip.lua',
  dependencies = {
    'nvim-telescope/telescope.nvim'
  },
  event = 'VeryLazy',
  config = function()
    require('neoclip').setup()
    pcall(require('telescope').load_extension, 'neoclip')
    vim.keymap.set('n', '<leader>tp', function() require('telescope').extensions.neoclip.default() end,
      { silent = true, desc = 'Open neoclip' })
  end
}
