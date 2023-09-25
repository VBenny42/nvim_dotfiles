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
      {
        'rcarriga/nvim-notify',
        opts = {
          stages = 'slide'
        }
        -- config = function(_, opts)
        --   vim.notify = require('notify')
        --   require('notify').setup(opts)
        -- end
      }
    }
  },
  -- {
  --   'rcarriga/nvim-notify',
  --   enabled = true,
  --   event = 'VeryLazy',
  --   opts = {
  --     stages = 'slide'
  --   },
  --   config = function(_, opts)
  --     vim.notify = require('notify')
  --     require('notify').setup(opts)
  --   end
  -- }
  {
    'vigoux/notifier.nvim',
    config = true
  }
}
