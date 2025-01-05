---@type LazySpec
return {
  'chrisgrieser/nvim-chainsaw',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>lv',
      function() require('chainsaw').variableLog() end,
      mode = { 'n', 'v' },
      desc = 'Log variable under cursor'
    },
    {
      '<leader>lm',
      function() require('chainsaw').messageLog() end,
      mode = { 'n', 'v' },
      desc = 'Log message under cursor'
    },
    {
      '<leader>lc',
      function() require('chainsaw').removeLogs() end,
      mode = { 'n', 'v' },
      desc = 'Remove all logs'
    }
  },
  opts = {
    marker = 'LOG:',
    visuals = {
      signHlgroup = ''
    }
  }
}
