return {
  'folke/flash.nvim',
  -- I don't like beause it takes over t/T, f/F.
  -- I'll figure out eventually.
  enabled = false,
  event = 'VeryLazy',
  opts = {},
  keys = {
    { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' }
  }
}
