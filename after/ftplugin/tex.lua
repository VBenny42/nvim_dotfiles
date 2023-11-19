vim.api.nvim_create_autocmd(
  'QuitPre',
  {
    pattern = '*.tex',
    command = 'VimtexClean'
  }
)
