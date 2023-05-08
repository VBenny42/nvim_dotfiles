local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.setup({
    defaults = {
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    }
})
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'luasnip')
pcall(require('telescope').load_extension, 'aerial')
pcall(require('telescope').load_extension, 'file_browser')

-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>ps', function()
--     builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)

-- kickstart setup
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        previewer = false,
    }))
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sa', function()
    require('telescope.builtin').live_grep({ hidden = true, no_ignore = true })
    end, { desc = '[S]earch by Grep [A]ll Files' })
vim.keymap.set('n', '<leader>sF', function()
    require('telescope.builtin').find_files({ hidden = true, no_ignore = true })
    end, { desc = '[S]earch [F]iles [A]ll Files' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>so', require('telescope').extensions.aerial.aerial, { desc = '[S]earch [O]utline' })
vim.keymap.set('n', '<leader>sO', require('telescope.builtin').lsp_document_symbols, { desc = '[S]earch [O]utline with all Symbols. <C-l> to filter by type.' })

vim.keymap.set('n', '<leader>ls', require('telescope').extensions.luasnip.luasnip, { desc = '[L]ua[S]nippets' })
vim.keymap.set('n', '<leader>tr', require('telescope.builtin').resume, { desc = '[T]elescope [R]esume' })
vim.keymap.set('n', '<leader>km', require('telescope.builtin').keymaps, { desc = 'Telescope [K]ey[M]aps' })
