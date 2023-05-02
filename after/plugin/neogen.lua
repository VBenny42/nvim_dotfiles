require('neogen').setup({
    snippet_engine = 'luasnip',
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>nf", function() require('neogen').generate() end, vim.tbl_deep_extend("keep", opts, { desc = 'Generate function annotation' }))
vim.keymap.set("n", "<Leader>nc", function () require('neogen').generate({ type = 'class' }) end, vim.tbl_deep_extend("keep", opts, { desc = 'Generate class annotation' }))
