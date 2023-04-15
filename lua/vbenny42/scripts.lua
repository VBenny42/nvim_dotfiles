vim.api.nvim_create_user_command('Source', 'source $MYVIMRC', {})

local function python_script(args)
   print("hello")
end
-- python centering script
vim.api.nvim_buf_create_user_command(0, 'Center', python_script, {})
