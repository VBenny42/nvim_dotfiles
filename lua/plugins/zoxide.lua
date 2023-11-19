return {
  'jvgrootveld/telescope-zoxide',
  dependencies = {
    'nvim-telescope/telescope.nvim'
  },
  event = 'VeryLazy',
  config = function()
    local t = require('telescope')
    t.load_extension('zoxide')
    vim.keymap.set('n', '<leader>cd', t.extensions.zoxide.list, { desc = 'Zoxide' })
  end
}
