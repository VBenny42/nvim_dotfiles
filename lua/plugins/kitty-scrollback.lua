return {
  'mikesmithgh/kitty-scrollback.nvim',
  enabled = false,
  lazy = true,
  cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
  event = { 'User KittyScrollbackLaunch' },
  config = true
}
