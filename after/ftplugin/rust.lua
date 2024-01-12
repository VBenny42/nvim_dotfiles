vim.keymap.set('n', '<leader>ct', ':Cargo test', { noremap = true, silent = false, desc = 'Start cargo test' })
vim.keymap.set('n', '<leader>cr', ':Cargo run', { noremap = true, silent = false, desc = 'Start cargo run' })

vim.api.nvim_create_autocmd('BufRead', {
  group = vim.api.nvim_create_augroup('CmpSourceCargo', { clear = true }),
  pattern = 'Cargo.toml',
  callback = function()
    require('cmp').setup.buffer({ sources = { { name = 'crates' } } })
  end
})
