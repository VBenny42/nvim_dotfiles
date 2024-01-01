return {
  'ThePrimeagen/harpoon',
  enabled = false,
  opts = {
    save_on_toggle = true
  },
  keys = {
    { '<leader>t', function() require('harpoon.mark').add_file() end,        desc = 'Add file [t]o harpoon' },
    { '<leader>T', function() require('harpoon.ui').toggle_quick_menu() end, desc = 'Toggle harpoon quick menu' },
    { '<A-1>',     function() require('harpoon.ui').nav_file(1) end,         desc = 'Navigate to harpoon file at position 1' },
    { '<A-2>',     function() require('harpoon.ui').nav_file(2) end,         desc = 'Navigate to harpoon file at position 2' },
    { '<A-3>',     function() require('harpoon.ui').nav_file(3) end,         desc = 'Navigate to harpoon file at position 3' },
    { '<A-4>',     function() require('harpoon.ui').nav_file(4) end,         desc = 'Navigate to harpoon file at position 4' }
  }
}
