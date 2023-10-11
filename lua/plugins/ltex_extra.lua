return {
  'barreiroleo/ltex_extra.nvim',
  ft = { 'markdown', 'tex' },
  dependencies = { 'neovim/nvim-lspconfig' },
  opts = {
    path = vim.fn.expand('~') .. '/.local/share/ltex'
  }
}
