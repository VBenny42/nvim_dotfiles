local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>t", mark.add_file, { desc = 'Add file [t]o harpoon' })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = 'Toggle harpoon quick menu' })

vim.keymap.set("n", "<A-1>", function() ui.nav_file(1) end, { desc = 'Navigate to harpoon file at position 1' })
vim.keymap.set("n", "<A-2>", function() ui.nav_file(2) end, { desc = 'Navigate to harpoon file at position 2' })
vim.keymap.set("n", "<A-3>", function() ui.nav_file(3) end, { desc = 'Navigate to harpoon file at position 3' })
vim.keymap.set("n", "<A-4>", function() ui.nav_file(4) end, { desc = 'Navigate to harpoon file at position 4' })

require("harpoon").setup({
    save_on_toggle = true
})
