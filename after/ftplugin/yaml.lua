local bufname = vim.api.nvim_buf_get_name(0)

local find_yml = string.find(bufname, 'docker%-compose%.yml$')
local find_yaml = string.find(bufname, 'docker%-compose%.yaml$')

if find_yml or find_yaml then
  vim.api.nvim_set_option_value('filetype', 'yaml.docker-compose', { buf = 0 })
end
