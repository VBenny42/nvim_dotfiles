return {
  {
    'stevearc/oil.nvim',
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      win_options = {
        signcolumn = 'yes:2',
        wrap = true
      },
      view_options = {
        show_hidden = true,
        natural_order = true
      },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true
    },
    keys = {
      { '<leader>pV', '<CMD>Oil<CR>',                               desc = 'Open oil' },
      -- Might swap the two keymaps if I find myself using the float more often
      { '-',          '<CMD>Oil<CR>',                               desc = 'Open oil' },
      { '<leader>-',  function() require('oil').toggle_float() end, desc = 'Toggle oil float' }
    }
  },
  {
    'refractalize/oil-git-status.nvim',
    dependencies = { 'stevearc/oil.nvim' },
    config = true
  }
}
