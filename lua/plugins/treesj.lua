return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {},
  config = function(_, opts)
    vim.keymap.set('n', '<leader>m', require('treesj').toggle, { desc = 'Split/Join' })
    require('treesj').setup(opts)
  end
}
