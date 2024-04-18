return {
  {
    'andymass/vim-matchup',
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    },
    init = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
      require('nvim-treesitter.configs').setup {
        matchup = {
          enable = true
        }
      }
    end
  }
  -- {
  --   'yorickpeterse/nvim-tree-pairs',
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter'
  --   },
  --   config = true
  -- }
}
