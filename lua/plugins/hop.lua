return {
  'phaazon/hop.nvim',
  branch = 'v2',
  keys = {
    { 'gh', function() require('hop').hint_words() end, mode = { 'n', 'v' }, noremap = true, silent = true,
      desc = 'Hop to word' } },
  config = true
}
