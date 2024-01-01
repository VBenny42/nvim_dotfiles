vim.keymap.set('n', '\\s', '<CMD>g/Unstaged/ norm vips<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '\\p', function()
  local buf = vim.api.nvim_get_current_buf()
  local filetype = vim.api.nvim_buf_get_option(buf, 'filetype')
  if filetype == 'fugitive' then
    vim.cmd('G push')
  else
    vim.cmd('norm! "+p<CR>')
  end
end, { silent = true, noremap = true })
