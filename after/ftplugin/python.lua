local colorscheme = 'kanagawa'
local ok, _ = pcall(vim.api.nvim_command, 'colorscheme ' .. colorscheme)
if not ok then
  print('error setting colorscheme ' .. colorscheme)
end
ok, _ = pcall(vim.api.nvim_command, 'set colorcolumn=89')
if not ok then
  print 'error setting 80 column line'
end
