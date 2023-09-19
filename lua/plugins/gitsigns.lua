return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┃' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']g', function()
          if vim.wo.diff then return ']g' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = 'Go to next hunk' })

        map('n', '[g', function()
          if vim.wo.diff then return '[g' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = 'Go to previous hunk' })

        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

        map('n', '<leader>hs', gs.stage_hunk, { desc = '[S]tage [H]unk' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = '[R]eset [H]unk' })
        map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
          { desc = '[S]tage [H]unk' })
        map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
          { desc = '[R]eset [H]unk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = '[S]tage Buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = '[U]ndo [S]tage [H]unk' })
      end
    }
  end
}
