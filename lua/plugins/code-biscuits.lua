return {
  'code-biscuits/nvim-biscuits',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  build = ':TSUpdate',
  keys = {
    { '<leader>cb', function() require('nvim-biscuits').toggle_biscuits() end, desc = 'Toggle Code Biscuits' }
  },
  event = 'CursorHold',
  opts = {
    cursor_line_only = true,
    on_events = { 'InsertLeave', 'CursorHoldI' }
  }
}
