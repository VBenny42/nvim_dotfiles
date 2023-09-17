return {
  {
    'arcticicestudio/nord-vim',
    enabled = true,
    lazy = false,
    name = 'nord',
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme nord]])
    end
  },
  -- {
  --   'shaunsingh/nord.nvim',
  --   lazy = false,
  --   name = 'nord',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme nord]])
  --
  --     vim.g.nord_borders = true
  --     require('nord').set()
  --   end
  -- },
}
