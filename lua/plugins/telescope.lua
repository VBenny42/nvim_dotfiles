return {
  'nvim-telescope/telescope.nvim',
  enabled = true,
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope-fzf-native.nvim',
    'benfowler/telescope-luasnip.nvim', 'nvim-telescope/telescope-file-browser.nvim'
  },
  opts = {
    -- defaults = {
    --   borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
    -- }
  },
  keys = {
    { '<leader>?',  function() require('telescope.builtin').oldfiles() end,    desc = '[?] find recently opened files' },
    {
      '<leader><space>',
      function()
        require('telescope.builtin').buffers()
      end,
      desc = '[ ] find existing buffers'
    },
    {
      '<leader>/',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
          previewer = false,
        }))
      end,
      desc = '[/] fuzzily search in current buffer]'
    },
    { '<leader>sf', function() require('telescope.builtin').find_files() end,  desc = '[S]earch [F]iles' },
    { '<leader>sh', function() require('telescope.builtin').help_tags() end,   desc = '[S]earch [H]elp' },
    { '<leader>sw', function() require('telescope.builtin').grep_string() end, desc = '[S]earch current [W]ord' },
    { '<leader>sg', function() require('telescope.builtin').live_grep() end,   desc = '[S]earch by [G]rep' },
    {
      '<leader>sa',
      function()
        require('telescope.builtin').live_grep({ hidden = true, no_ignore = true })
      end,
      desc = '[S]earch by grep [A]ll files'
    },
    {
      '<leader>sF',
      function() require('telescope.builtin').find_files({ hidden = true, no_ignore = true }) end,
      desc =
      '[S]earch [F]iles [A]ll files'
    },
    {
      '<leader>sd',
      function() require('telescope.builtin').diagnostics() end,
      desc =
      '[S]earch [D]iagnostics'
    },
    {
      '<leader>so',
      function() require('telescope.builtin').lsp_document_symbols() end,
      desc =
      '[S]earch [O]utline with all symbols. <c-l> to filter by type.'
    },
    {
      '<leader>sO',
      function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end,
      desc =
      '[S]earch entire [O]utline with all symbols. <c-l> to filter by type.'
    },
    {
      '<leader>sb',
      function() require('telescope.builtin').buffers() end,
      desc =
      '[S]earch [B]uffers'
    },
    { '<leader>tr', function() require('telescope.builtin').resume() end,          desc = '[T]elescope [R]esume' },
    { '<leader>km', function() require('telescope.builtin').keymaps() end,         desc = 'Telescope [K]ey[M]aps' },
    { '<leader>ch', function() require('telescope.builtin').command_history() end, desc = 'Telescope [C]ommand [H]istory' },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'luasnip')
    -- pcall(require('telescope').load_extension, 'aerial')
    pcall(require('telescope').load_extension, 'file_browser')
  end
}
