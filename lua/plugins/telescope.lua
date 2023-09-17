return {
  'nvim-telescope/telescope.nvim',
  enabled = true,
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope-fzf-native.nvim', 'benfowler/telescope-luasnip.nvim', 'nvim-telescope/telescope-file-browser.nvim' },
  config = function()
    local telescope = require('telescope')

    telescope.setup({
      defaults = {
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
      mappings = {
        n = {
          ["<C-D>"] = require('telescope.actions').delete_buffer,
        },
        i = {
          ["<C-D>"] = require('telescope.actions').delete_buffer,
        }
      }
    })
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'luasnip')
    pcall(require('telescope').load_extension, 'aerial')
    pcall(require('telescope').load_extension, 'file_browser')

    -- kickstart setup
    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        previewer = false,
      }))
    end, { desc = '[/] Fuzzily search in current buffer]' })

    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sa', function()
      require('telescope.builtin').live_grep({ hidden = true, no_ignore = true })
    end, { desc = '[S]earch by Grep [A]ll Files' })
    vim.keymap.set('n', '<leader>sF', function()
      require('telescope.builtin').find_files({ hidden = true, no_ignore = true })
    end, { desc = '[S]earch [F]iles [A]ll Files' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    -- vim.keymap.set('n', '<leader>so', require('telescope').extensions.aerial.aerial, { desc = '[S]earch [O]utline' })
    vim.keymap.set('n', '<leader>sO', require('telescope.builtin').lsp_dynamic_workspace_symbols,
      { desc = '[S]earch Entire [O]utline with all Symbols. <C-l> to filter by type.' })
    vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols,
      { desc = '[S]earch [O]utline with all Symbols. <C-l> to filter by type.' })

    vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })

    vim.keymap.set('n', '<leader>ls', require('telescope').extensions.luasnip.luasnip, { desc = '[L]ua[S]nippets' })
    vim.keymap.set('n', '<leader>tr', require('telescope.builtin').resume, { desc = '[T]elescope [R]esume' })
    vim.keymap.set('n', '<leader>km', require('telescope.builtin').keymaps, { desc = 'Telescope [K]ey[M]aps' })
    vim.keymap.set('n', '<leader>ch', require('telescope.builtin').command_history,
      { desc = 'Telescope [C]ommand [H]istory' })
  end
}
