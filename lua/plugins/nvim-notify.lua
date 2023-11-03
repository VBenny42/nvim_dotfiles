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
    -- vim.notify = require('notify')

    -- vim.keymap.set('n', '<BS>', function()
    --   for _, win in ipairs(vim.api.nvim_list_wins()) do
    --     local buf = vim.api.nvim_win_get_buf(win)
    --     if vim.fn.bufexists(buf) == 1 and vim.api.nvim_get_option_value('filetype', { buf = buf }) == 'notify' then
    --       vim.api.nvim_win_close(win, false)
    --     end
    --   end
    -- end, { noremap = true, silent = false })
  end
}
