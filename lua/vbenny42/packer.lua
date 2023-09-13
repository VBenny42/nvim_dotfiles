-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use('kyazdani42/nvim-web-devicons')
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make', cond = vim.fn.executable 'make' == 1
  }
  use {
    'benfowler/telescope-luasnip.nvim'
  }

  use {
    'nvim-telescope/telescope-file-browser.nvim',
    requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  }

  use {
    'startup-nvim/startup.nvim',
    requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function() require('startup').setup({ theme = 'vbenny' }) end
  }

  use { 'Vonr/align.nvim' }

  use({
    'arcticicestudio/nord-vim',
    as = 'nord',
    config = function()
      vim.cmd('colorscheme nord')
    end
  })

  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }

  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('todo-comments').setup() end
  }

  use {
    'Wansmer/treesj',
    requires = { 'nvim-treesitter' },
    config = function()
      require('treesj').setup({})
    end,
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly',                 -- optional, updated every week. (see issue #1193)
  }

  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/nvim-treesitter-textobjects')
  use('RRethy/nvim-treesitter-textsubjects')
  use('nvim-treesitter/playground')
  use {
    'romgrk/nvim-treesitter-context',
    config = function() require('treesitter-context').setup { enable = true } end
  }

  use('onsails/lspkind.nvim')

  use('github/copilot.vim')
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('danymat/neogen')

  use('rust-lang/rust.vim')

  use('tpope/vim-fugitive')
  use('tpope/vim-repeat')
  use('tpope/vim-unimpaired')
  use('tpope/vim-abolish')
  use('tpope/vim-rhubarb')
  use('tpope/vim-dispatch')
  use('qpkorr/vim-renamer')

  use('mhartington/formatter.nvim')

  use {
    'kylechui/nvim-surround',
    tag = '*', -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require('nvim-surround').setup()
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┃' },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']g', function()
            if vim.wo.diff then return ']g' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[g', function()
            if vim.wo.diff then return '[g' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })
        end
      }
    end
  }
  use {
    'luukvbaal/statuscol.nvim',
    config = function() require('statuscol').setup() end
  }

  use { 'smjonas/live-command.nvim', config = function()
    require('live-command').setup {
      commands = {
        S = { cmd = 'Subvert' }, -- must be defined before we import vim-abolish
      },
    }
  end }

  use('easymotion/vim-easymotion')
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function() require('hop').setup() end
  }
  use('junegunn/vim-easy-align')

  use('itchyny/lightline.vim')

  use('ryanoasis/vim-devicons')

  use('voldikss/vim-floaterm')

  use {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup() end
  }

  use({
    "piersolenski/wtf.nvim",
    config = function()
      require("wtf").setup()
    end,
    requires = {
      "MunifTanjim/nui.nvim",
    }
  })

  use {
    'andweeb/presence.nvim',
    config = function() require('presence').setup() end
  }
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      -- Snippet Collection (Optional)
      { 'rafamadriz/friendly-snippets' },
    }
  }
end)
