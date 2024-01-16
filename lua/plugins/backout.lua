return {
  'AgusDOLARD/backout.nvim',
  keys = {
    { '<M-u>', function() require('backout').back() end, mode = { 'i' } },
    { '<M-i>', function() require('backout').out() end,  mode = { 'i' } }
  },
  config = true
}
