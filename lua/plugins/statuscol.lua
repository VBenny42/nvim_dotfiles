return {
  'luukvbaal/statuscol.nvim',
  dependencies = { 'lewis6991/gitsigns.nvim' },
  opts = {},
  config = function(_, opts)
    local function gitsigns_click(args)
      print(args)
      if args.button == 'l' then
        require('gitsigns').preview_hunk()
        print('preview')
      elseif args.button == 'm' then
        require('gitsigns').reset_hunk()
      elseif args.button == 'r' then
        require('gitsigns').stage_hunk()
      end
    end

    local cfg = {
      clickhandlers = {
        GitSignsTopdelete       = gitsigns_click,
        GitSignsUntracked       = gitsigns_click,
        GitSignsAdd             = gitsigns_click,
        GitSignsChange          = gitsigns_click,
        GitSignsChangedelete    = gitsigns_click,
        GitSignsDelete          = gitsigns_click,
        gitsigns_extmark_signs_ = gitsigns_click
      }
    }
    require('statuscol').setup(cfg)
  end
}
