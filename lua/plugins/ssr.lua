return {
  'cshuaimin/ssr.nvim',
  main = 'ssr',
  enabled = false,
  keys = {
    { '<leader>sr', function() require('ssr').open() end, mode = { 'n', 'x' }, desc = 'Open SSR' }
  }
}
