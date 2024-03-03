return {
  'barreiroleo/ltex_extra.nvim',
  enabled = true,
  ft = { 'markdown', 'tex' },
  dependencies = { 'neovim/nvim-lspconfig' },
  opts = {
    path = vim.fn.expand('~') .. '/.local/share/ltex'
  }
}
