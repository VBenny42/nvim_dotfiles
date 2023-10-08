return {
  'itchyny/lightline.vim',
  dependencies = { 'ryanoasis/vim-devicons', 'tpope/vim-fugitive' },
  enabled = false,
  priority = 1000,
  config = function()
    vim.cmd('let g:lightline#bufferline#enable_devicons = 1')

    vim.g['lightline'] = {
      colorscheme = 'nord',
      active = {
        left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } },
        right = { { 'lineinfo' }, { 'percent' }, { 'fileformat', 'fileencoding', 'filetype' } }
      },
      component_function = {
        gitbranch = 'FugitiveHead',
        filetype = 'MyFiletype'
      }
    }

    vim.cmd [[
  function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction
]]
  end
}
