---@class LazySpec
return {
  {
    'mawkler/demicolon.nvim',
    keys = { ';', ',', 't', 'f', 'T', 'F', ']', '[', ']d', '[d', ']g', '[g' }, -- Uncomment this to lazy load
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = {
      keymaps = {
        -- Create t/T/f/F key mappings
        horizontal_motions = false,
        -- Create ]d/[d, etc. key mappings to jump to diganostics. See demicolon.keymaps.create_default_diagnostic_keymaps
        diagnostic_motions = true,
        -- Create ; and , key mappings
        repeat_motions = true,
      },
      integrations = {
        -- Integration with https://github.com/lewis6991/gitsigns.nvim
        gitsigns = {
          enabled = true,
          keymaps = {
            next = ']g',
            prev = '[g',
          },
        },
      },
    },
    config = function(_, opts)
      require('demicolon').setup(opts)

      local function eyeliner_jump(key)
        local forward = vim.list_contains({ 't', 'f' }, key)
        return function()
          require('eyeliner').highlight({ forward = forward })
          return require('demicolon.jump').horizontal_jump(key)()
        end
      end

      local nxo = { 'n', 'x', 'o' }
      local opts_set = { expr = true }

      vim.keymap.set(nxo, 'f', eyeliner_jump('f'), opts_set)
      vim.keymap.set(nxo, 'F', eyeliner_jump('F'), opts_set)
      vim.keymap.set(nxo, 't', eyeliner_jump('t'), opts_set)
      vim.keymap.set(nxo, 'T', eyeliner_jump('T'), opts_set)
    end
  },
  {
    'jinh0/eyeliner.nvim',
    keys = { 't', 'f', 'T', 'F' },
    opts = {
      highlight_on_key = true,
      dim = true,
      default_keymaps = false,
    }
  }
}
