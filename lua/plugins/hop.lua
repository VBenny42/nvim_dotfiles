return {
  'smoka7/hop.nvim',
  version = '*',
  opts = {
    keys = 'etovxqpdygfblzhckisuran'
  },
  keys = {
    {
      'gh',
      function() require('hop').hint_words() end,
      mode = { 'n', 'o' },
      noremap = true,
      silent = true,
      desc = 'Hop to word'
    }
    -- { 'f' }, { 'F' }, { 't' }, { 'T' }
  },
  config = function(opts)
    -- local hop = require('hop')
    -- local directions = require('hop.hint').HintDirection

    -- vim.keymap.set('', 'f',
    --   function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end, { remap = true })
    -- vim.keymap.set('', 'F',
    --   function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end, { remap = true })
    -- vim.keymap.set('', 't',
    --   function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end,
    --   { remap = true })
    -- vim.keymap.set('', 'T',
    --   function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end,
    --   { remap = true })

    require('hop').setup(opts)
  end
}
