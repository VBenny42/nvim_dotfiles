return {
  'barreiroleo/ltex_extra.nvim',
  enabled = false,
  ft = { 'markdown', 'tex' },
  dependencies = { 'neovim/nvim-lspconfig' },
  opts = {
    path = vim.fn.expand('~') .. '/.local/share/ltex'
  }
}
