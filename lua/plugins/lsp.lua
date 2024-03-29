return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
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

    lsp.preset('recommended')

    for name, icon in pairs({
      Error = '',
      Warn = '',
      Hint = '',
      Info = '',
      Other = ''
    }) do
      name = 'DiagnosticSign' .. name
      vim.fn.sign_define(name, {
        text = icon,
        texthl = name,
        numhl = ''
      })
    end

    -- Fix Undefined global 'vim'
    lsp.configure('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          },
          telemetry = { enable = false },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
            }
          },
          format = {
            enable = true,
            -- Put format options here
            -- NOTE: the value should be String!
            defaultConfig = {
              indent_style = 'space',
              indent_size = '2',
              quote_style = 'single',
              trailing_table_separator = 'never'
            }
          }
        }
      }
    })

    lsp.ensure_installed({
      'tsserver',
      'eslint',
      'lua_ls'
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
      -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
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

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end)

    lsp.skip_server_setup({ 'rust_analyzer' })

    lsp.setup()

    -- Diagnostic keymaps
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

    vim.diagnostic.config({
      update_in_insert = false

    })

    local cmp = require('cmp')
    local keymap = require('cmp.utils.keymap')
    local luasnip = require('luasnip')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = vim.tbl_extend('keep', lsp.defaults.cmp_mappings({
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      -- ['CR'] = cmp.mapping.confirm({ select = true }),
      ['<C-Space>'] = cmp.mapping.complete()
    }), {
      ['<Tab>'] = cmp.mapping(
        function(fallback)
          -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              cmp.confirm()
            end
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            if vim.fn.pumvisible() == 0 then
              vim.api.nvim_feedkeys(keymap.t('<C-z>'), 'in', true)
            else
              vim.api.nvim_feedkeys(keymap.t('<C-n>'), 'in', true)
            end
          end
        end, { 'i', 's', 'c' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' })
    })

    require('luasnip.loaders.from_vscode').lazy_load()

    lsp.setup_nvim_cmp({
      mapping = cmp_mappings,
      formatting = {
        format = lspkind.cmp_format({ mode = 'symbol', with_text = true, maxwidth = 50 })
      }
    })

    cmp.setup({
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' }
      },
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true })
      },
      formatting = {
        format = lspkind.cmp_format({ mode = 'symbol_text', with_text = true, maxwidth = 50 })
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
          { name = 'conventionalcommits' },
          { name = 'luasnip' }
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
