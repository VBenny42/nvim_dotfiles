return {
  'rgroli/other.nvim',
  enabled = true,
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
      },
      {
        pattern = '/(.*).go$',
        target = {
          {
            target = '/%1_test.go',
            context = 'test'
          }
        }
      },
      {
        pattern = '/(.*)_test.go$',
        target = {
          {
            target = '/%1.go',
            context = 'source'
          }
        }
      }
    }
  },
  main = 'other-nvim'
}
