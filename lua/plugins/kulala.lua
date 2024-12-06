return {
  'mistweaverco/kulala.nvim',
  enabled = true,
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
