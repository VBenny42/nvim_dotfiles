-- This file can be loaded by calling `lua require('plugins')` from your init.vim

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

    use({
        'arcticicestudio/nord-vim',
        as = 'nord',
        config = function()
            vim.cmd('colorscheme nord')
        end
    })
    -- use({
    --     'shaunsingh/nord.nvim',
    --     config = function()
    --         require('nord').set()
    --     end
    -- })

    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup {} end
    }

    -- use {
    --     'nvim-tree/nvim-tree.lua',
    --     requires = {
    --         'nvim-tree/nvim-web-devicons', -- optional, for file icons
    --     },
    --     tag = 'nightly' -- optional, updated every week. (see issue #1193)
    -- }

    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-textobjects')
    use('nvim-treesitter/playground')
    use {
        'romgrk/nvim-treesitter-context',
        config = function() require('treesitter-context').setup { enable = true } end
    }

    -- use {
    --     'zbirenbaum/copilot.lua',
    --     cmd = 'Copilot',
    --     event = 'InsertEnter',
    --     config = function() require('copilot').setup({
    --         suggestion = { enabled = false },
    --         panel = { enabled = false },
    --     }) end
    -- }
    -- use {
    --     "zbirenbaum/copilot-cmp",
    --     after = { "copilot.lua" },
    --     config = function() require("copilot_cmp").setup() end
    -- }
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
    use('tpope/vim-surround')

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
                }
            }
        end
    }
    use {
        'luukvbaal/statuscol.nvim',
        config = function() require('statuscol').setup() end
    }

    use('lervag/vimtex')

    use { 'smjonas/live-command.nvim', config = function()
        require('live-command').setup {
            commands = {
                S = { cmd = 'Subvert' }, -- must be defined before we import vim-abolish
            },
        }
    end }

    use('easymotion/vim-easymotion')
    use('bkad/CamelCaseMotion')
    use('junegunn/vim-easy-align')

    use('itchyny/lightline.vim')
    use('ryanoasis/vim-devicons')
    -- use {
    --     'nvim-lualine/lualine.nvim',
    --     requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    -- }

    use('voldikss/vim-floaterm')

    use {
      'stevearc/aerial.nvim',
      config = function() require('aerial').setup() end
    }

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

-- -- Automatically source and re-compile packer whenever you save this init.lua
-- local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
--   group = packer_group,
--   pattern = "packer.lua"
-- })
