return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  enabled = true,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },

    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys",   gap = 1, padding = 1 },
        { section = "startup" },
        {
          section = "terminal",
          cmd = "pokemon-colorscripts -r --no-title; sleep .1",
          random = 10,
          pane = 2,
          indent = 4,
          height = 30,
        },
      },

    },

    indent = {
      enabled = true,
      indent = { char = "▎" },
      animate = { enabled = false },
      scope = { enabled = false },
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
