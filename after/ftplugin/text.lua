-- local autogroup = vim.api.nvim_create_augroup('MyTxt', { clear = false })

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = '*.txt',
--   desc = 'Make each sentence its own line.',
--   group = autogroup,
--   callback = function()
--   end
-- }
-- )

local bufnr = vim.api.nvim_get_current_buf()
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>.', '<cmd>%s/\\([\\.!\\?]\\)/\1\r/g<CR>',
  { noremap = true, silent = true })
