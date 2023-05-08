vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "show [G]it" })

vim.keymap.set("n", "<leader>gb", "<cmd>silent GBrowse .<CR>", { desc = "[G]it [B]rowse ", })
