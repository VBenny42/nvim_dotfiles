return {
  'rgroli/other.nvim',
  enabled = false,
  cmd = { 'Other', 'OtherSplit', 'OtherTabNew', 'OtherVSplit' },
  keys = { { '<leader>o', '<CMD>Other<CR>', noremap = true, silent = true } },
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
  main = 'other-nvim'
}
