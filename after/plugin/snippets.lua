vim.cmd [[
    " Expand
    imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'
    " Jump forward
    imap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
    smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
    " Jump backward
    imap <silent><expr> kj luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-j>'
    smap <silent><expr> kj luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-j>'
    " Cycle forward through choice nodes with Control-F
    imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
    smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
]]

require("luasnip").config.set_config({ -- Setting LuaSnip config
    -- Enable autotriggered snippets
    enable_autosnippets = true,
})
