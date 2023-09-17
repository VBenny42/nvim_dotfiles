-- local function SuggestOneCharacter()
--   local suggestion = vim.fn['copilot#Accept']("")
--   local bar = vim.fn['copilot#TextQueuedForInsertion']()
--   return bar:sub(1, 1)
-- end

return {
  'github/copilot.vim',
  event = 'InsertEnter',
  config = function()
    vim.cmd [[
    imap <silent><script><expr> <M-Tab> copilot#Accept("\<CR>")
    let g:copilot_no_tab_map = v:true
    imap <silent> <C-j> <Plug>(copilot-next)
    imap <silent> <C-k> <Plug>(copilot-previous)
    imap <silent> <C-l> <Plug>(copilot-dismiss)
]]

    local function SuggestOneWord()
      local suggestion = vim.fn['copilot#Accept']("")
      local bar = vim.fn['copilot#TextQueuedForInsertion']()
      return vim.fn.split(bar, [[[ .]\zs]])[1]
    end

    vim.keymap.set("i", "<M-=>", SuggestOneWord, { silent = true, expr = true, desc = "Suggest one word from copilot" })

    vim.g.copilot_assume_mapped = true
    vim.g.copilot_filetypes = {
      ["javascript"] = true,
      ["typescript"] = true,
      ["c"] = true,
      ["python"] = true,
      ["lua"] = true,
      ["rust"] = true,
      ["sh"] = true,
      ["zsh"] = true,
      ["make"] = true,
      ["dockerfile"] = true,
      ["toml"] = true,
      ["yaml"] = true,
      ["*"] = true,
    }
  end
}
