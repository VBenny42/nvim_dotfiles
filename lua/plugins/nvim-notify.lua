return {
  'rcarriga/nvim-notify',
  enabled = true,
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    stages = 'static'
  },
  config = function(_, opts)
    require('notify').setup(opts)
    pcall(require('telescope').load_extension, 'notify')
  end
}
