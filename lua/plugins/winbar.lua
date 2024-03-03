return {
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    enabled = true,
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons'
    },
    opts = {
      -- configurations go here
    }
  },
  {
    'Bekaboo/dropbar.nvim',
    dependencies = { 'nvim-telescope/telescope-fzf-native.nvim' },
    enabled = false,
    config = function()
      vim.cmd('hi WinBar guibg=NONE')
    end
  }
}
