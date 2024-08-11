local group = vim.api.nvim_create_augroup('CheckCompose', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' },
  {
    pattern = { 'docker-compose.yaml', 'docker-compose.yml', 'compose.yml', 'compose.yaml' },
    group = group,
    command = 'set filetype=yaml.docker-compose',
    desc = 'Set filetype to yaml.docker-compose for docker-compose files',
    once = true
  }
)
