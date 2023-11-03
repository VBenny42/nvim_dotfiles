return {
  'lervag/vimtex',
  ft = 'tex',
  init = function()
    vim.cmd [[
          let maplocalleader = ','

          let g:vimtex_quickfix_open_on_warning = 0

            let g:vimtex_view_method = 'skim'

            let g:vimtex_quickfix_ignore_filters = [
              \ 'Underfull \\hbox',
              \ 'Overfull \\hbox',
              \ 'LaTeX Warning: .\+ float specifier changed to',
              \ 'LaTeX hooks Warning',
              \ 'Package siunitx Warning: Detected the "physics" package:',
              \ 'Package hyperref Warning: Token not allowed in a PDF string',
              \]
      ]]

    vim.opt.foldmethod = 'manual'

    vim.keymap.set('i', '<S-CR>', '\\\\<CR>', { silent = true })

    vim.keymap.set('n', 'dse', '<Plug>(vimtex-env-delete)')
    vim.keymap.set('n', 'dsm', '<Plug>(vimtex-env-delete-math)')

    vim.keymap.set({ 'x', 'o' }, 'am', '<Plug>(vimtex-a$)')
    vim.keymap.set({ 'x', 'o' }, 'im', '<Plug>(vimtex-i$)')
    vim.keymap.set({ 'x', 'o' }, 'ai', '<Plug>(vimtex-am)')
    vim.keymap.set({ 'x', 'o' }, 'ii', '<Plug>(vimtex-im)')

    vim.keymap.set({ 'x', 'o' }, 'ac', '<Plug>(vimtex-ac)')
    vim.keymap.set({ 'x', 'o' }, 'id', '<Plug>(vimtex-id)')
    vim.keymap.set({ 'x', 'o' }, 'ae', '<Plug>(vimtex-ae)')

    vim.keymap.set('n', '<localleader>v', '<Plug>(vimtex-view)', { silent = true, desc = 'View PDF' })
    vim.keymap.set('n', '<localleader>li', '<Plug>(vimtex-info)', { silent = true })
    vim.keymap.set('n', '<localleader>ll', '<Plug>(vimtex-compile)', { silent = true })
    vim.keymap.set('n', '<M-0>', '<Plug>(vimtex-compile)', { silent = true })
  end
}
