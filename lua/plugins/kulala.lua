return {
  'mistweaverco/kulala.nvim',
  ft = 'http',
  enabled = false,
  config = function()
    vim.filetype.add({
      extension = {
        ['http'] = 'http'
      }
    })
    -- Usage:
    -- require('kulala').run()
  end
}
