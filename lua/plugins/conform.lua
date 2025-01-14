local slow_format_filetypes = {}
return {
  'stevearc/conform.nvim',
  enabled = true,
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      desc = 'Format buffer'
    }
  },
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      css = { 'prettierd' },
      html = { 'prettierd' },
      json = { 'prettierd' },
      sql = { 'sleek' },
      jsonc = { 'prettierd' },
      yaml = { 'prettierd' },
      markdown = { 'deno_fmt' },
      graphql = { 'prettierd' },
      python = { 'ruff_format' },
      latex = { 'latexindent' },
      tex = { 'latexindent' },
      c = { 'clang-format' },
      ['_'] = { 'trim_whitespace', 'trim_newlines' }
    },
    log_level = vim.log.levels.DEBUG,
    format_on_save = function(bufnr)
      if slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      local function on_format(err)
        if err and err:match('timeout$') then
          slow_format_filetypes[vim.bo[bufnr].filetype] = true
        end
      end

      return { timeout_ms = 200, lsp_fallback = true, on_format }
    end,
    format_after_save = function(bufnr)
      if not slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      return { lsp_fallback = true }
    end,
    formatters = {
      latexindent = {
        prepend_args = function()
          return { '-m' }
        end
      },
      -- deno_fmt = {
      --   append_args = function()
      --     return { '--indent-width=4' }
      --   end
      -- },
    }
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  config = function(_, opts)
    if vim.g.started_by_firenvim then
      opts.format_on_save = false
      opts.format_after_save = false
    end
    require('conform').setup(opts)
  end
}
