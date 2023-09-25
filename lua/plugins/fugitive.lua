return {
  'tpope/vim-fugitive',
  keys = {
    { '<leader>gs', vim.cmd.Git,                 desc = 'show [G]it' },
    { '<leader>gb', '<cmd>silent GBrowse .<CR>', desc = '[G]it [B]rowse ' },
    { '<leader>gp', '<cmd>G push<CR>',           desc = '[G]it [P]ush' }
  }
}
