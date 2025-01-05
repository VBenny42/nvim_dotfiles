---@type LazySpec
return {
  'EvWilson/slimux.nvim',
  enabled = true,
  keys = {
    {
      ',r',
      function()
        local command = '\16'
        require('slimux').send(command)
      end,
      desc = 'Rerun previous command in last tmux pane'
    },
    {
      ',c',
      function()
        local command = vim.fn.input('Command to send: ')
        require('slimux').send(command)
      end,
      desc = 'Run a command in last tmux pane'
    },
    {
      '<leader>ts',
      function()
        require('slimux').send_highlighted_text()
      end,
      mode = 'v',
      desc = 'Send currently highlighted text to configured tmux pane'
    }
  },
  config = function()
    local slimux = require('slimux')
    slimux.setup({
      target_socket = slimux.get_tmux_socket(),
      target_pane = string.format('%s.{last}', slimux.get_tmux_window())
    })
  end
}
