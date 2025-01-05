return {
  'mawkler/demicolon.nvim',
  -- keys = { ';', ',', 't', 'f', 'T', 'F', ']', '[', ']d', '[d' }, -- Uncomment this to lazy load
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = {
    integrations = {
      -- Integration with https://github.com/lewis6991/gitsigns.nvim
      gitsigns = {
        enabled = true,
        keymaps = {
          next = ']g',
          prev = '[g',
        },
      },
    },
  }
}
