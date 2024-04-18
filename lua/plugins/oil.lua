return {
  {
    'stevearc/oil.nvim',
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      win_options = {
        signcolumn = 'yes:2'
      }
    },
    keys = {
      { '<leader>pV', '<CMD>Oil<CR>', desc = 'Open oil' },
      { '-',          '<CMD>Oil<CR>', desc = 'Open oil' }
    }
  },
  {
    'refractalize/oil-git-status.nvim',
    dependencies = { 'stevearc/oil.nvim' },
    config = true
  }
}
