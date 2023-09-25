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

  {
    'qpkorr/vim-renamer',
    cmd = { 'Renamer' }
  },

  {
    'luukvbaal/statuscol.nvim',
    config = function()
      local builtin = require 'statuscol.builtin'
      require('statuscol').setup {
        relculright = true,
        segments = {
          { text = { builtin.foldfunc },      click = 'v:lua.ScFa' },
          { text = { '%s' },                  click = 'v:lua.ScSa' },
          { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' }
        }
      }
    end
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
    'lervag/vimtex',
    ft = 'tex'
  },

  {
    'Bekaboo/dropbar.nvim'
  }
}
