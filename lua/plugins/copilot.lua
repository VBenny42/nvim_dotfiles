return {
  {
    'github/copilot.vim',
    event = 'InsertEnter',
    enabled = false,
    init = function()
      vim.cmd
      [[
    imap <silent><script><expr> <M-Tab> copilot#Accept("\<CR>")
    let g:copilot_no_tab_map = v:true
    imap <silent> <C-j> <Plug>(copilot-next)
    imap <silent> <C-k> <Plug>(copilot-previous)
    imap <silent> <C-l> <Plug>(copilot-dismiss)
    ]]

      vim.g.copilot_assume_mapped = true
      vim.g.copilot_filetypes = {
        ['javascript'] = true,
        ['typescript'] = true,
        ['c'] = true,
        ['python'] = true,
        ['lua'] = true,
        ['rust'] = true,
        ['sh'] = true,
        ['zsh'] = true,
        ['make'] = true,
        ['dockerfile'] = true,
        ['toml'] = true,
        ['yaml'] = true,
        ['*'] = true
      }
    end
  },
  {
    'zbirenbaum/copilot.lua',
    enabled = true,
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = '<M-Tab>',
          accept_word = '<M-=>',
          accept_line = '<M-+>',
          next = '<C-j>',
          previous = '<C-k>',
          dismiss = '<C-l>'
        },
        filetypes = {
          javascript = true,
          typescript = true,
          c = true,
          python = true,
          markdown = true,
          lua = true,
          rust = true,
          sh = true,
          zsh = true,
          make = true,
          dockerfile = true,
          toml = true,
          yaml = true,
          ['*'] = true
        }
      }
    }
  }
  -- {
  --   'jonahgoldwastaken/copilot-status.nvim',
  --   dependencies = { 'copilot.lua' }, -- or "zbirenbaum/copilot.lua"
  --   lazy = true
  --   -- config = function()
  --   --   equire('copilot-status').setup()
  --   -- end
  -- }
}
