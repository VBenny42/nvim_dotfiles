return {
  'luukvbaal/statuscol.nvim',
  dependencies = { 'lewis6991/gitsigns.nvim' },
  config = function()
    local builtin = require('statuscol.builtin')

    local opts = {
      relculright = false, -- whether to right-align the cursor line number with 'relativenumber' set
      segments = {
        {
          -- Git Signs
          text = { '%s' },
          sign = { name = { 'GitSigns' }, maxwidth = 1, colwidth = 1, auto = false },
          click = 'v:lua.ScSa'
        },
        {
          -- Line Numbers
          text = { builtin.lnumfunc, ' ' },
          condition = { true, builtin.not_empty },
          click = 'v:lua.ScLa'
        }
      }
    }

    require('statuscol').setup(opts)
  end
}
