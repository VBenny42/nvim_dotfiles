return {
  'folke/persistence.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    {
      '<leader>qd',
      function() require('persistence').load() end,
      desc =
      'Load [S]ession for current directory'
    },
    { '<leader>ql', function() require('persistence').load({ last = true }) end, desc = 'Load [L]ast Session' },
    { '<leader>qs', function() require('persistence').stop() end,                desc = 'Stop Saving Session' }
  },
  config = true
}
