return {
  'VBenny42/gx.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = { 'gx' },
  opts = {
    handlers = {
      plugin = true,       -- open plugin links in lua (e.g. packer, lazy, ..)
      github = true,       -- open github issues
      brewfile = true,     -- open Homebrew formulaes and casks
      package_json = true, -- open dependencies from package.json
      search = true        -- search the web/selection on the web if nothing else is found
    }
  }
}
