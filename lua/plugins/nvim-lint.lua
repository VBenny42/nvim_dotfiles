return {
  'mfussenegger/nvim-lint',
  ft = { 'sh', 'zsh', 'bash', 'zshrc' },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      sh = { 'shellcheck' },
      zsh = { 'shellcheck' },
      bash = { 'shellcheck' },
      zshrc = { 'shellcheck' }
    }

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' },
      {
        pattern = { '*.sh', '*.zsh', '*.bash', '*.zshrc' },
        desc = 'Lint for shell scripts',
        callback = function()
          lint.try_lint()
        end
      }
    )
  end
}
