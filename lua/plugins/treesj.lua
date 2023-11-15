return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  keys = {
    { '<leader>m', function() require('treesj').toggle() end, desc = 'Split/Join' }
  },
  config = true
}
