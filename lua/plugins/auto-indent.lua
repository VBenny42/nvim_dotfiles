return {
  'vidocqh/auto-indent.nvim',
  event = { 'InsertEnter' },
  opts = {
    indentexpr = function(lnum)
      return require('nvim-treesitter.indent').get_indent(lnum)
    end
  }
}
