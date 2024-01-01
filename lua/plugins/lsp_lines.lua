return {
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  event = 'LspAttach',
  keys = {
    -- I don't know if I'll use this or not
    { '<leader>lt', function() require('lsp_lines').toggle() end, doc = 'Toggle LSP lines' }
  },
  config = function()
    require('lsp_lines').setup()
    vim.diagnostic.config({ virtual_text = false })
  end
}
