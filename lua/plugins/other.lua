return {
  'rgroli/other.nvim',
  cmd = { 'Other', 'OtherSplit', 'OtherTabNew', 'OtherVSplit' },
  keys = { { '<leader>o', '<CMD>:Other<CR>', noremap = true, silent = true } },
  opts = {
    mappings = {
      {
        pattern = '/(.*).c$',
        target = {
          {
            target = '/%1.h',
            context = 'header'
          }
        }
      },
      {
        pattern = '/(.*).h$',
        target = {
          {
            target = '/%1.c',
            context = 'source'
          }
        }
      }
    }
  },
  config = function(_, opts)
    require('other-nvim').setup(opts)
  end
}
