local function delete_buffers(prompt_bufnr)
  local actions_state = require('telescope.actions.state')
  local actions = require('telescope.actions')

  local current_picker = actions_state.get_current_picker(prompt_bufnr)
  local selected_entries = current_picker:get_multi_selection()

  -- if there are no selected entries then delete single buffer hovered
  if #selected_entries == 0 then
    local selected_entry = actions_state.get_selected_entry()
    vim.api.nvim_buf_delete(selected_entry.bufnr, { force = true })
    actions.close(prompt_bufnr)
    return
  end

  -- Loop over all selected entries and delete each file
  for _, entry in ipairs(selected_entries) do
    vim.api.nvim_buf_delete(entry.bufnr, { force = true })
  end

  -- Close the picker
  actions.close(prompt_bufnr)
end

return {
  'nvim-telescope/telescope.nvim',
  enabled = true,
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'benfowler/telescope-luasnip.nvim'
  },
  opts = {
    defaults = {
      prompt_prefix = '󰼛 '
    },
    pickers = {
      buffers = {
        mappings = {
          n = {
            ['dd'] = delete_buffers
          },
          i = {
            ['<c-d>'] = delete_buffers
          }
        }
      }
    }
  },
  keys = {
    { '<leader>?',       require('telescope.builtin').oldfiles,                      desc = '[?] find recently opened files' },
    { '<leader><space>', require('telescope.builtin').buffers,                       desc = '[ ] find existing buffers' },
    { '<leader>sf',      require('telescope.builtin').find_files,                    desc = '[S]earch [F]iles' },
    { '<leader>sh',      require('telescope.builtin').help_tags,                     desc = '[S]earch [H]elp' },
    { '<leader>sw',      require('telescope.builtin').grep_string,                   desc = '[S]earch current [W]ord' },
    { '<leader>sg',      require('telescope.builtin').live_grep,                     desc = '[S]earch by [G]rep' },
    { '<leader>sb',      require('telescope.builtin').buffers,                       desc = '[S]earch [B]uffers' },
    { '<leader>tr',      require('telescope.builtin').resume,                        desc = '[T]elescope [R]esume' },
    { '<leader>km',      require('telescope.builtin').keymaps,                       desc = 'Telescope [K]ey[M]aps' },
    { '<leader>ch',      require('telescope.builtin').command_history,               desc = 'Telescope [C]ommand [H]istory' },
    { '<leader>gr',      require('telescope.builtin').lsp_references,                desc = '[G]oto [R]eferences' },
    { '<leader>gt',      require('telescope.builtin').git_status,                    desc = '[G]it [S]tatus Files' },
    { '<leader>ds',      require('telescope.builtin').lsp_document_symbols,          desc = '[D]ocument [S]ymbols' },
    { '<leader>ws',      require('telescope.builtin').lsp_dynamic_workspace_symbols, desc = '[W]orkspace [S]ymbols' },
    { '<leader>sd',      require('telescope.builtin').diagnostics,                   desc = '[S]earch [D]iagnostics' },
    {
      '<leader>/',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
          previewer = false
        }))
      end,
      desc = '[/] fuzzily search in current buffer]'
    },
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
      desc = '[S]earch [F]iles [A]ll files'
    },
    {
      '<leader>so',
      require('telescope.builtin').lsp_document_symbols,
      desc = '[S]earch [O]utline with all symbols. <c-l> to filter by type.'
    },
    {
      '<leader>sO',
      require('telescope.builtin').lsp_dynamic_workspace_symbols,
      desc = '[S]earch entire [O]utline with all symbols. <c-l> to filter by type.'
    }
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'luasnip')
    -- pcall(require('telescope').load_extension, 'aerial')
  end
}
