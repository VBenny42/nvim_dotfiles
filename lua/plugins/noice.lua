return {
  'folke/noice.nvim',
  enabled = true,
  event = 'VeryLazy',
  -- add any options here
  opts = {
    cmdline = {
      format = {
        search_down = { icon = ' ' },
        search_up = { icon = ' ' }
      }
      -- view = 'cmdline'
    },
    routes = {
      {
        view = 'cmdline',
        filter = { event = 'msg_showmode' }
      }
    },
    notify = {
      replace = true,
      merge = true
    },
    lsp = {
      progress = {
        enabled = false
      },
      signature = {
        enabled = false
      },
      hover = {
        enabled = false
      },
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true
      }

    }
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify'
  }
}
