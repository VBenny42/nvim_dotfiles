local lsp_lines_on = true
local opts = {
  virtual_text = false,
  virtual_lines = true
}

local function lsp_lines_toggle()
  lsp_lines_on = not lsp_lines_on
  opts.virtual_text = not opts.virtual_text
  opts.virtual_lines = not opts.virtual_lines
  vim.diagnostic.config(opts)
end

return {
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  -- event = 'LspAttach',
  keys = {
    -- I don't know if I'll use this or not
    { '<leader>lt', lsp_lines_toggle, desc = 'Toggle LSP lines' }
  },
  config = function()
    require('lsp_lines').setup()
    lsp_lines_toggle()
  end
}
