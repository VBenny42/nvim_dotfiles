return {
  "junegunn/vim-easy-align",
  event = "VeryLazy",
  config = function()
    vim.keymap.set({ "n", "x" }, "ga", "<Plug>(EasyAlign)")
  end
}
