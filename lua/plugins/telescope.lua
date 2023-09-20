return {
  'nvim-telescope/telescope.nvim',
  enabled = true,
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope-fzf-native.nvim',
    'benfowler/telescope-luasnip.nvim', 'nvim-telescope/telescope-file-browser.nvim'
  },
  config = function()
    local telescope = require('telescope')

    telescope.setup({
      defaults = {
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
      mappings = {
        n = {
          ["<c-d>"] = require('telescope.actions').delete_buffer,
        },
        i = {
          ["<c-d>"] = require('telescope.actions').delete_buffer,
        }
      }
    })
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'luasnip')
    -- pcall(require('telescope').load_extension, 'aerial')
    pcall(require('telescope').load_extension, 'file_browser')

    -- kickstart setup
    -- see `:help telescope.builtin`
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] find recently opened files' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] find existing buffers' })
    vim.keymap.set('n', '<leader>/', function()
      -- you can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        previewer = false,
      }))
    end, { desc = '[/] fuzzily search in current buffer]' })

    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[s]earch [f]iles' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[s]earch [h]elp' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[s]earch current [w]ord' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[s]earch by [g]rep' })
    vim.keymap.set('n', '<leader>sa', function()
      require('telescope.builtin').live_grep({ hidden = true, no_ignore = true })
    end, { desc = '[s]earch by grep [a]ll files' })
    vim.keymap.set('n', '<leader>sf', function()
      require('telescope.builtin').find_files({ hidden = true, no_ignore = true })
    end, { desc = '[s]earch [f]iles [a]ll files' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[s]earch [d]iagnostics' })
    -- vim.keymap.set('n', '<leader>so', require('telescope').extensions.aerial.aerial, { desc = '[s]earch [o]utline' })
    vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_dynamic_workspace_symbols,
      { desc = '[s]earch entire [o]utline with all symbols. <c-l> to filter by type.' })
    vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols,
      { desc = '[s]earch [o]utline with all symbols. <c-l> to filter by type.' })

    vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[s]earch [b]uffers' })

    vim.keymap.set('n', '<leader>ls', require('telescope').extensions.luasnip.luasnip, { desc = '[l]ua[s]nippets' })
    vim.keymap.set('n', '<leader>tr', require('telescope.builtin').resume, { desc = '[t]elescope [r]esume' })
    vim.keymap.set('n', '<leader>km', require('telescope.builtin').keymaps, { desc = 'telescope [k]ey[m]aps' })
    vim.keymap.set('n', '<leader>ch', require('telescope.builtin').command_history,
      { desc = 'telescope [c]ommand [h]istory' })
  end
}
