-- Provides the 'sticky' current context (as seen in pycharm)
return {
  'nvim-treesitter/nvim-treesitter-context',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesitter-context').setup {}
  end,
}
