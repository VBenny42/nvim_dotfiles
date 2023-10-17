return {
  'L3MON4D3/LuaSnip',
  event = 'InsertEnter',
  keys = {
    { '<leader>ls', function() require('telescope').extensions.luasnip.luasnip() end, desc = '[L]ua[S]nippets' }
  },
  config = function()
    vim.cmd [[
    " Expand
    imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'
    " Jump forward
    imap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Esc>'
    smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Esc>'
    " Jump backward
    imap <silent><expr> kj luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-j>'
    smap <silent><expr> kj luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-j>'
    " Cycle forward through choice nodes with Control-F
    imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
    smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
]]

    require('luasnip').config.set_config({ -- Setting LuaSnip config
      -- Enable autotriggered snippets
      enable_autosnippets = true,
      store_selection_keys = '<Tab>'
    })

    require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/LuaSnip/' })
    require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/LuaSnip/' })
  end
}
