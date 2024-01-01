return {
  'cshuaimin/ssr.nvim',
  main = 'ssr',
  keys = {
    { '<leader>sr', function() require('ssr').open() end, mode = { 'n', 'x' }, desc = 'Open SSR' }
  }
}
