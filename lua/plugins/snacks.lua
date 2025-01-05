return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  enabled = true,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    indent = {
      enabled = true,
      indent = {
        char = "▎",
      },
      animate = {
        enabled = false
      },
      scope = {
        enabled = false
      }
    },
    input = { enabled = true },
    notifier = {
      enabled = true,
      style = "compact"
    },
    quickfile = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
}
