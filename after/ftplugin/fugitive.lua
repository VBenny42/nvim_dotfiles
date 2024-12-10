vim.keymap.set('n', '\\s', '<CMD>g/Unstaged/ norm vips<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '\\t', '<CMD>g/Untracked/ norm vips<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '\\p', function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = bufnr })
  if filetype == 'fugitive' then
    vim.cmd('G push')
  else
    vim.cmd('norm! "+p<CR>')
  end
end, { silent = true, noremap = true })

vim.api.nvim_create_user_command(
  'Browse',
  function(opts)
    vim.fn.system { 'open', opts.fargs[1] }
  end,
  { nargs = 1 }
)
