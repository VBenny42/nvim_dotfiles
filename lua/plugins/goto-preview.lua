return {
  'rmagatti/goto-preview',
  -- event = 'LspAttach',
  keys = {
    { 'gpd', function() require('goto-preview').goto_preview_definition() end,      desc = 'Goto Preview Definition' },
    { 'gpt', function() require('goto-preview').goto_preview_type_definition() end, desc = 'Goto Preview Type Definition' },
    { 'gpi', function() require('goto-preview').goto_preview_implementation() end,  desc = 'Goto Preview Implementation' },
    { 'gpD', function() require('goto-preview').goto_preview_declaration() end,     desc = 'Goto Preview Declaration' },
    { 'gP ', function() require('goto-preview').close_all_win() end,                desc = 'Close All Preview Windows' },
    { 'gpr', function() require('goto-preview').goto_preview_references() end,      desc = 'Goto Preview References' }
  },
  config = true
}
