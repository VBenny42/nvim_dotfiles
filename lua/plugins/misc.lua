return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true
  },

  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true
  },

  {
    'numToStr/Comment.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true
  },

  {
    'rust-lang/rust.vim',
    ft = 'rust',
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

  {
    'qpkorr/vim-renamer',
    cmd = { 'Renamer' },
  },

  {
    'luukvbaal/statuscol.nvim',
    config = true
  },

  {
    'smjonas/live-command.nvim',
    enabled = false,
    opts = { commands = { S = { cmd = 'Subvert' } } },
    dependencies = { 'tpope/vim-repeat' },
  },

  {
    'stevearc/aerial.nvim',
    lazy = true,
    cmd = { 'AerialOpen', 'AerialClose' },
    config = function ()
      pcall(require('telescope').load_extension, 'aerial')
      require('aerial').setup()
    end,
  },

  {
    'andweeb/presence.nvim',
    lazy = true,
    config = true,
  }
}
