require('neogen').setup({
    snippet_engine = 'luasnip',
})

vim.keymap.set("n", "<Leader>nf", function() require('neogen').generate() end, { noremap = true, silent = true, desc = 'Generate function' })
vim.keymap.set("n", "<Leader>nc", function () require('neogen').generate({ type = 'class' }) end, { noremap = true, silent = true, desc = 'Generate class annotation' })
