return {
  -- {
  --   'arcticicestudio/nord-vim',
  --   enabled = true,
  --   lazy = false,
  --   name = 'nord',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme nord]])
  --   end
  -- }
  {
    'shaunsingh/nord.nvim',
    lazy = false,
    name = 'nord',
    priority = 1000,
    config = function()
      -- turns off LSP semantic tokens by default
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          client.server_capabilities.semanticTokensProvider = nil
        end
      })

      vim.g.nord_borders = true
      vim.g.nord_contrast = true
      vim.g.nord_italic = false
      vim.g.nord_bold = false
      require('nord').set()
    end
  }
}
