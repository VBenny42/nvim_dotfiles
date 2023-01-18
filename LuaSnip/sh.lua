local get_visual = function(args, parent)
  if (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else
    return sn(nil, i(1))
  end
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    s({trig = "fl", snippetType="autosnippet"},
      fmt(
        [[
        for {} in {}; do
          {}
        done
        ]],
        {
          i(1),
          i(2),
          i(0)
        }
      ),
      {condition = line_begin}
    )
}
