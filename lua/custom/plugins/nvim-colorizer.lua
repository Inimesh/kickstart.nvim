return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup {
      css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
      html = { names = false }, -- Disable parsing "names" like Blue or Gray
      -- TODO: js? ts? figure out how to specify
    }
  end,
}
