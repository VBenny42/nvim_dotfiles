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
    'numToStr/Comment.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true
  },

  {
    'rust-lang/rust.vim',
    ft = 'rust'
  },

  {
    'mhartington/formatter.nvim',
    enabled = false
  },

  {
    'kylechui/nvim-surround',
    event = 'InsertEnter',
    config = true
  },

  { 'tpope/vim-repeat' },
  { 'tpope/vim-unimpaired' },
  { 'tpope/vim-abolish' },
  { 'tpope/vim-rhubarb' },
  { 'tpope/vim-dispatch' },
  { 'tpope/vim-sleuth' },

  {
    'qpkorr/vim-renamer',
    cmd = { 'Renamer' }
  },

  {
    'smjonas/live-command.nvim',
    enabled = true,
    opts = { commands = { S = { cmd = 'Subvert' } } },
    dependencies = { 'tpope/vim-repeat' },
    config = function(_, opts)
      require('live-command').setup(opts)
    end
  },

  {
    'stevearc/aerial.nvim',
    lazy = true,
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
  },

  {
    'Bekaboo/dropbar.nvim'
  }
}
