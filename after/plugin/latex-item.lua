local get_root = function(bufnr)
  local parser = vim.treesitter.get_parser(bufnr, 'latex', {})
  local tree = parser:parse()[1]
  return tree:root()
end

local number_to_letter_map = {
  [1] = 'a',
  [2] = 'b',
  [3] = 'c',
  [4] = 'd',
  [5] = 'e',
  [6] = 'f',
  [7] = 'g',
  [8] = 'h',
  [9] = 'i',
  [10] = 'j',
  [11] = 'k',
  [12] = 'l',
  [13] = 'm',
  [14] = 'n',
  [15] = 'o',
  [16] = 'p',
  [17] = 'q',
  [18] = 'r',
  [19] = 's',
  [20] = 't',
  [21] = 'u',
  [22] = 'v',
  [23] = 'w',
  [24] = 'x',
  [25] = 'y',
  [26] = 'z'
}

local function count_to_string(count, name)
  if name == 'first_lvl_item' then
    return tostring(count) .. '.'
  elseif name == 'second_lvl_item' then
    if count > 26 then
      return tostring(count) .. ')'
    end
    return number_to_letter_map[count] .. ')'
  end
end

local function get_item_numbers(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  if vim.bo[bufnr].filetype ~= 'tex' then
    vim.notify('Not a TeX file', vim.log.levels.ERROR)
    return
  end
  local ts_captures = vim.treesitter.query.parse('latex', [[
(generic_environment
  (begin
    (curly_group_text
      ((text) @document
              (#eq? @document "document")
              )
      )
    )
  ((generic_environment
      (begin
        (curly_group_text
          ((text) @top_lvl_enumerate
                  (#eq? @top_lvl_enumerate "enumerate")
          )
        )
      )
      (enum_item
        ((generic_environment
          (begin
            (curly_group_text
              ((text) @second_lvl_enumerate
                      (#eq? @second_lvl_enumerate "enumerate")
              )
            )
          )
          (enum_item) @second_lvl_item
        )?)
      ) @first_lvl_item
    ))
  )
  ]])

  local root = get_root(bufnr)
  local set = {}
  local first_lvl_count = 1
  local second_lvl_count = 1
  local count = 1
  local ns_id = vim.api.nvim_create_namespace('item_numbers')
  for id, node in ts_captures:iter_captures(root, bufnr, 0, -1) do
    local name = ts_captures.captures[id]
    if name ~= 'first_lvl_item' and name ~= 'second_lvl_item' then
      goto continue
    end
    local range = { node:range() }
    if set[range[1]] == range[2] then
      goto continue
    else
      set[range[1]] = range[2]
    end

    if name == 'first_lvl_item' then
      count = first_lvl_count
      first_lvl_count = first_lvl_count + 1
      second_lvl_count = 1
    else
      count = second_lvl_count
      second_lvl_count = second_lvl_count + 1
    end
    vim.api.nvim_buf_set_extmark(bufnr, ns_id, range[1], range[2], {
      virt_text = {
        {
          count_to_string(count, name), -- .. ' (' .. tostring(id) .. ') ',
          'CursorLine'
        }
      },
      virt_text_pos = 'inline'
    })
    ::continue::
  end
end

local function clearItemNumbers(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local ns_id = vim.api.nvim_create_namespace('item_numbers')
  vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
end

vim.api.nvim_create_user_command('GenerateItemNumbers', function()
  get_item_numbers(nil)
end, { desc = 'Generate item numbers' })

vim.api.nvim_create_user_command('ClearItemNumbers', function()
  clearItemNumbers(nil)
end, { desc = 'Clear item numbers' })
