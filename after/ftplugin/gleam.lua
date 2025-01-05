require("lspconfig").gleam.setup({})
vim.notify("Gleam LSP started", vim.log.levels.INFO, { title = "LSP" })
