return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup()
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
  },

  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true
  },

  {
    'folke/lsp-colors.nvim',
    config = true
  },

  {
    'folke/twilight.nvim',
    cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' },
    opts = {}
  },

  {
    'rust-lang/rust.vim',
    ft = 'rust'
  },

  { 'tpope/vim-repeat' },
  { 'tpope/vim-unimpaired' },
  { 'tpope/vim-abolish' },
  { 'tpope/vim-rhubarb' },
  { 'tpope/vim-dispatch' },
  { 'tpope/vim-sleuth' },

  {
    'kana/vim-textobj-entire',
    event = { 'InsertEnter' },
    dependencies = { 'kana/vim-textobj-user' }
  },

  {
    'qpkorr/vim-renamer',
    cmd = { 'Renamer' }
  },

  {
    'stevearc/aerial.nvim',
    cmd = { 'AerialOpen', 'AerialClose' },
    config = function()
      pcall(require('telescope').load_extension, 'aerial')
      require('aerial').setup()
    end
  },

  {
    'andweeb/presence.nvim',
    event = 'VeryLazy',
    config = true
  }
}
