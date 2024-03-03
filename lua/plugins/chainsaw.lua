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
  -- Add opts for C and Rust maybe? Only works for Python, JS and Lua by default
  config = true,
  opts = {
    marker = 'LOG:',
    logStatements = {
      variableLog = {
        rust = 'println!("{} {}: {:?}", "%s", "%s", %s);'
      },
      messageLog = {
        rust = 'println!("{} ", "%s");'
      }
    }
  }
}
