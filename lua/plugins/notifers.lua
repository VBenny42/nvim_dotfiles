return {
  {
    'folke/noice.nvim',
    enabled = false,
    event = 'VeryLazy',
    -- add any options here
    opts = {
      cmdline = {
        format = {
          search_down = { icon = ' ' },
          search_up = { icon = ' ' }
        },
        view = 'cmdline'
      },
      routes = {
        {
          view = 'cmdline',
          filter = { event = 'msg_showmode' }
        }
      }
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify'
    }
  },
  {
    'rcarriga/nvim-notify',
    enabled = true,
    event = 'BufReadPre',
    opts = {
      stages = 'slide'
    },
    config = function(_, opts)
      require('notify').setup(opts)
      vim.notify = require('notify')

      vim.keymap.set('n', '<BS>', function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.fn.bufexists(buf) == 1 and vim.api.nvim_get_option_value('filetype', { buf = buf }) == 'notify' then
            vim.api.nvim_win_close(win, false)
          end
        end
      end, { noremap = true, silent = false })
    end
  },
  {
    'vigoux/notifier.nvim',
    enabled = false,
    config = true
  }
}
