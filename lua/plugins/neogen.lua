return {
  'danymat/neogen',
  opts = { snippet_engine = 'luasnip' },
  keys = {
    {
      '<Leader>nf',
      function()
        require('neogen').generate()
      end,
      noremap = true,
      silent = true,
      desc = 'Generate function annotation'
    },
    {
      '<Leader>nc',
      function()
        require('neogen').generate({ type = 'class' })
      end,
      noremap = true,
      silent = true,
      desc = 'Generate class annotation'
    }
  }
}
