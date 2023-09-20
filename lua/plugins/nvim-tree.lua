return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = true,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = { { "<leader>pv", vim.cmd.NvimTreeToggle, desc = "Open nvim-tree" } },
    opts = {
      disable_netrw = false,
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          git_placement = "signcolumn",
        },
      },
      update_focused_file = { enable = true }
    },
    config = function(_, opts)
      local function natural_cmp(left, right)
        left = left.name:lower()
        right = right.name:lower()

        if left == right then
          return false
        end

        for i = 1, math.max(string.len(left), string.len(right)), 1 do
          local l = string.sub(left, i, -1)
          local r = string.sub(right, i, -1)

          if type(tonumber(string.sub(l, 1, 1))) == "number" and type(tonumber(string.sub(r, 1, 1))) == "number" then
            local l_number = tonumber(string.match(l, "^[0-9]+"))
            local r_number = tonumber(string.match(r, "^[0-9]+"))

            if l_number ~= r_number then
              return l_number < r_number
            end
          elseif string.sub(l, 1, 1) ~= string.sub(r, 1, 1) then
            return l < r
          end
        end
      end

      require("nvim-tree").setup(vim.tbl_deep_extend("keep", opts,
        { sort_by = function(nodes) table.sort(nodes, natural_cmp) end }))

      require("lsp-file-operations").setup()
    end,
  },
  {
    'antosha417/nvim-lsp-file-operations',
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    }
  }
}
