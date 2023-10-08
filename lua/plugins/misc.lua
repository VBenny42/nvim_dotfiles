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
    ft = 'tex',
    init = function()
      vim.cmd [[
          let maplocalleader = ','

          let g:vimtex_quickfix_open_on_warning = 0

            let g:vimtex_view_method = 'skim'

            let g:vimtex_quickfix_ignore_filters = [
              \ 'Underfull \\hbox',
              \ 'Overfull \\hbox',
              \ 'LaTeX Warning: .\+ float specifier changed to',
              \ 'LaTeX hooks Warning',
              \ 'Package siunitx Warning: Detected the "physics" package:',
              \ 'Package hyperref Warning: Token not allowed in a PDF string',
              \]
      ]]

      vim.opt.foldmethod = 'manual'

      vim.keymap.set('n', 'dse', '<Plug>(vimtex-env-delete)')
      vim.keymap.set('n', 'dsm', '<Plug>(vimtex-env-delete-math)')

      vim.keymap.set({ 'x', 'o' }, 'am', '<Plug>(vimtex-a$)')
      vim.keymap.set({ 'x', 'o' }, 'im', '<Plug>(vimtex-i$)')
      vim.keymap.set({ 'x', 'o' }, 'ai', '<Plug>(vimtex-am)')
      vim.keymap.set({ 'x', 'o' }, 'ii', '<Plug>(vimtex-im)')

      vim.keymap.set({ 'x', 'o' }, 'ac', '<Plug>(vimtex-ac)')
      vim.keymap.set({ 'x', 'o' }, 'id', '<Plug>(vimtex-id)')
      vim.keymap.set({ 'x', 'o' }, 'ae', '<Plug>(vimtex-ae)')

      vim.keymap.set('n', '<localleader>v', '<Plug>(vimtex-view)', { silent = true, desc = 'View PDF' })
      vim.keymap.set('n', '<localleader>li', '<Plug>(vimtex-info)')
      vim.keymap.set('n', '<localleader>ll', '<Plug>(vimtex-compile)')
      vim.keymap.set('n', '<M-0>', '<Plug>(vimtex-compile)')
    end
  },

  {
    'Bekaboo/dropbar.nvim'
  }
}
