vim.api.nvim_create_autocmd(
  'QuitPre',
  {
    pattern = '*.tex',
    command = 'VimtexClean'
  }
)

vim.cmd [[
function! s:write_server_name() abort
  echo 'Writing server name'
  let nvim_server_file = '/tmp/vimtexserver.txt'
  call writefile([v:servername], nvim_server_file)
endfunction

augroup vimtex_common
  autocmd!
  autocmd FileType tex call s:write_server_name()
augroup END
]]

require('nvim-surround').buffer_setup({
  surrounds = {
    ['c'] = {
      add = function()
        local cmd = require('nvim-surround.config').get_input 'Command: '
        return { { '\\' .. cmd .. '{' }, { '}' } }
      end
    },
    ['e'] = {
      add = function()
        local env = require('nvim-surround.config').get_input 'Environment: '
        return { { '\\begin{' .. env .. '}' }, { '\\end{' .. env .. '}' } }
      end
    },
    ['m'] = {
      add = function()
        return { { '$' }, { '$' } }
      end
    }
  }
})
--
-- vim.api.nvim_create_user_command('BreakLines',
--   function()
--     vim.cmd('s/\\./.\r/g')
--     require('conform').format({ async = true, lsp_fallback = true })
--   end, { desc = 'Break lines at periods' })
