return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┃' }
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
  },
  {
    'chrisgrieser/nvim-tinygit',
    dependencies = 'doums/suit.nvim',
    keys = {
      { '<leader>gc', function() require('tinygit').smartCommit() end, desc = '[G]it [C]ommit' },
      { '<leader>ga', function() require('tinygit').amendNoEdit() end, desc = '[G]it [A]mend' }
    }
  },
  {
    'tpope/vim-fugitive',
    keys = {
      { '<leader>gs', vim.cmd.Git,          desc = 'show [G]it' },
      { '<leader>gb', '<CMD>GBrowse .<CR>', desc = '[G]it [B]rowse ', silent = true },
      { '<leader>gp', '<CMD>G push<CR>',    desc = '[G]it [P]ush' }
    }
  }
}
