return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    {
      'williamboman/mason.nvim',
      cmd = 'Mason'
    },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'onsails/lspkind.nvim' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-cmdline' },
    {
      'uga-rosa/cmp-dictionary',
      ft = { 'markdown', 'text', 'latex' },
      config = function()
        require('cmp_dictionary').setup({
          paths = { '/usr/share/dict/words' },
          exact_length = 3
        })
      end
    },
    --{ 'dmitmel/cmp-cmdline-history' },
    { 'davidsierradz/cmp-conventionalcommits' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    -- Snippet Collection (Optional)
    { 'rafamadriz/friendly-snippets' }
  },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lsp = require('lsp-zero')
    local lspkind = require('lspkind')

    lsp.set_sign_icons({
      error = '',
      warn = '',
      hint = '',
      info = '',
      other = ''
    })

    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = { 'ts_ls', 'eslint', 'lua_ls', 'dockerls', 'docker_compose_language_service', 'pyright', 'gopls' },
      automatic_installation = true,
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,

        -- skip server setup for rust_analyzer
        rust_analyzer = function() end,

        gopls = function()
          require('lspconfig').gopls.setup({
            settings = {
              gopls = {
                gofumpt = true
              }
            }
          })
        end,


        lua_ls = function()
          require('lspconfig').lua_ls.setup {
            root_dir = require('lspconfig').util.root_pattern('init.lua', '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git')
          }
        end

      }
    })

    lsp.on_attach(function(_, bufnr)
      -- NOTE: Remember that lua is a real programming language, and as such it is possible
      -- to define small helper and utility functions so you don't have to repeat yourself
      -- many times.
      --
      -- In this case, we create a function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

      nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
      nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
      nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
      nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
      -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

      -- See `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- Lesser used LSP functionality
      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')
    end)

    lsp.setup()

    -- Diagnostic keymaps
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

    vim.diagnostic.config({
      update_in_insert = false
    })

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' }
      },
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab()
      },
      ---@diagnostic disable-next-line: missing-fields
      formatting = {
        expandable_indicator = true,
        format = lspkind.cmp_format({ mode = 'symbol_text', with_text = true, maxwidth = 50 })
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end
      }
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
        --{ name = 'cmdline_history' }
      }
    })

    cmp.setup.filetype('gitcommit', {
      sources = require('cmp').config.sources(
        {
          { name = 'luasnip' },
          { name = 'conventionalcommits' }
        },
        { { name = 'buffer' } }
      )
    })

    cmp.setup.filetype('markdown', {
      sources = require('cmp').config.sources(
        {
          { name = 'luasnip' },
          { name = 'dictionary', keyword_length = 3 }
        },
        { { name = 'buffer' } }
      )
    })

    cmp.setup.filetype('text', {
      sources = require('cmp').config.sources(
        {
          { name = 'dictionary', keyword_length = 3 }
        },
        { { name = 'buffer' } }
      )
    })

    cmp.setup.filetype('tex', {
      sources = require('cmp').config.sources(
        {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'dictionary', keyword_length = 3 },
          { name = 'buffer' }
        },
        { { name = 'buffer' } }
      )
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
        --{ name = 'cmdline_history' }
      }, {
        { name = 'cmdline' }
      })
    })
  end
}
