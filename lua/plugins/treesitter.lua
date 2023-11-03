return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-context'
    },
    event = 'BufReadPost',
    opts = {
      ensure_installed = { 'c', 'lua', 'javascript', 'typescript', 'vim', 'vimdoc', 'python' },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
        disable = { 'latex' }
      },
      indent = { enable = true, disable = { 'python' } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<c-backspace>'
        }
      },
      -- textsubjects = {
      --   enable = true,
      --   prev_selection = ',',
      --   keymaps = {
      --     ['.'] = 'textsubjects-smart',
      --     [';'] = 'textsubjects-container-outer',
      --     [';i'] = 'textsubjects-container-inner',
      --   },
      -- },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['aC'] = '@comment.outer'
          }
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
            [']a'] = '@parameter.inner'
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
            [']A'] = '@parameter.inner'
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
            ['[a'] = '@parameter.inner'
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
            ['[A'] = '@parameter.inner'
          }
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner'
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner'
          }
        },
        lsp_interop = {
          enable = true,
          border = 'none',
          floating_preview_opts = {},
          peek_definition_code = {
            ['<leader>df'] = '@function.outer',
            ['<leader>dF'] = '@class.outer'
          }
        }
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?'
        }
      }
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end
  },
  {
    'nvim-treesitter/playground',
    depends = 'nvim-treesitter/nvim-treesitter',
    cmd = 'TSPlaygroundToggle'
  }
}
