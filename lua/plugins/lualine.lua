return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      -- theme = 'nord',
      component_separators = '|',
      section_separators = '',
      globalstatus = true
    },
    sections = {
      lualine_b = {
        { 'branch',      on_click = function() vim.cmd('Git') end },
        { 'diff',        on_click = function() require('gitsigns').diffthis() end },
        { 'diagnostics', on_click = function() vim.diagnostic.setqflist() end }
      }
    },
    tabline = {
      lualine_a = {
        {
          'buffers',
          mode = 4,
          use_mode_colors = true,
          filetype_names = { lazy = 'Lazy 󰒲', fugitive = 'Fugitive' }
        }
      }
    }
  },
  config = function(_, opts)
    hidden = true
    vim.keymap.set('n', '<leader>tt', function()
      if hidden then
        require('lualine').hide({ unhide = true })
        hidden = false
      else
        require('lualine').hide({ place = { 'tabline' } })
        hidden = true
      end
    end, { desc = '[T]oggle [T]abs View' })

    local toggle = true
    vim.keymap.set('n', '<leader>ll', function()
      if toggle then
        toggle = false
        opts.sections.lualine_b[3] = { 'aerial', on_click = function() require('aerial').toggle() end }
      else
        toggle = true
        opts.sections.lualine_b[3] = nil
      end
      require('lualine').setup(opts)
      require('lualine').hide({ place = { 'tabline' } })
    end, { desc = 'Show Aerial in lualine' })

    require('lualine').setup(opts)
    require('lualine').hide({ place = { 'tabline' } })
  end
}
