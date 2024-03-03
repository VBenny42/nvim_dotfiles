vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pV', vim.cmd.Ex, { desc = 'Open netrw' })

vim.keymap.set('', 'Y', 'y$')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<leader>qq', '<cmd>wa | mksession! | qa<CR>', { desc = 'Save session and quit', silent = true })

vim.keymap.set('n', '<leader>bd', '<cmd>bd<CR>', { desc = '[B]uffer [D]elete', silent = true })

vim.keymap.set('n', 'Q', '@qj', { desc = 'Replay macro q', silent = true, remap = true })
vim.keymap.set('x', 'Q', ':norm @q<CR>', { desc = 'Replay macro q', silent = true, remap = true })

vim.keymap.set('n', ',w', '<cmd>update<CR>', { desc = 'Write buffer' })
vim.keymap.set('n', ',W', '<cmd>noautocmd update<CR>', { desc = 'Write buffer' })

local function toggle_quickfix()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win['quickfix'] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd 'cclose'
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd 'copen'
  end
end
-- vim.keymap.set('n', 'qc', '<cmd>cclose<CR>', { desc = '[C]lose [Q]uickfix' })
-- vim.keymap.set('n', 'qo', '<cmd>copen<CR>', { desc = '[O]pen [Q]uickfix' })
vim.keymap.set('n', 'qt', toggle_quickfix, { desc = '[T]oggle [Q]uickfix' })

-- greatest remap ever
vim.keymap.set({ 'n', 'v' }, '<leader>p', [["+p]], { desc = 'Paste from system clipboard' })
vim.keymap.set('x', '<leader>P', [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

vim.keymap.set({ 'n', 'v' }, '\\', [["+]], { desc = 'Select system clipboard', silent = true, remap = true })
vim.keymap.set({ 'n', 'v' }, '\\y', [["+y]], { desc = 'Select system clipboard and yank', silent = true, remap = true })

vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- Taken over by conform
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

vim.keymap.set('n', '<leader>S', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Search and replace word under cursor globally' })
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.cmd [[
nnoremap <silent> <M-[> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <silent> <M-]> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>
]]

local filetypes = {
  -- 'TelescopePrompt',
  'notify'
  -- 'noice'
}

local function inTable(tbl, item)
  for _, value in ipairs(tbl) do
    if value == item then
      return true
    end
  end
  return false
end

vim.keymap.set('n', '<BS>', function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.fn.bufexists(buf) == 1 and inTable(filetypes, vim.api.nvim_get_option_value('filetype', { buf = buf })) then
      vim.api.nvim_win_close(win, false)
      -- vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, { noremap = true, silent = false })

vim.keymap.set('n', ']\\', '*', { silent = true, desc = 'Go to next word under cursor' })
vim.keymap.set('n', '[\\', '#', { silent = true, desc = 'Go to previous word under cursor' })
