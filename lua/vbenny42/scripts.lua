vim.api.nvim_create_user_command('Source', 'source $MYVIMRC', {})

local function python_script(args)
  print('hello')
end
-- python centering script
vim.api.nvim_buf_create_user_command(0, 'Center', python_script, {})


function copyBreakpointInfo()
  -- Get the current filename
  local filename = vim.fn.expand('%:t')

  -- Get the current line number
  local lineNumber = vim.fn.line('.')

  -- Format the breakpoint information as "filename:lineNumber"
  local breakpointInfo = string.format('%s:%d', filename, lineNumber)

  -- Copy the breakpoint information to the system clipboard
  vim.fn.setreg('+', breakpointInfo)
  print('Breakpoint info copied: ' .. breakpointInfo)
end

-- function to delete all buffers except current ones
function deleteOtherBuffers()
  local currentBufferNumber = vim.fn.bufnr('%')
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  for _, buffer in ipairs(buffers) do
    local bufferNumber = buffer.bufnr
    if bufferNumber ~= currentBufferNumber then
      vim.api.nvim_buf_delete(bufferNumber, { force = true })
    end
  end
  print('Deleted all buffers except current one')
end

vim.keymap.set('n', '<leader>db', deleteOtherBuffers,
  { noremap = true, silent = true, desc = '[d]elete other [b]uffers' })

local yankGroup = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  command = 'silent! lua vim.highlight.on_yank({ timeout = 300 })',
  group = yankGroup
})


vim.keymap.set(
  'n',
  '<c-f>',
  function() return ':e ' .. vim.fn.expand '%:p:h' .. '/' end,
  { expr = true, desc = 'Open file in current directory' }
)
