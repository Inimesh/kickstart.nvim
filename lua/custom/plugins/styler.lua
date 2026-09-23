-- colorscheme per buffer
-- Only colorschemes that set highlights with vim.api.nvim_set_hl are supported.
return {
  'folke/styler.nvim',
  config = function()
    -- Styler builds each theme's namespace once, on first use. Complete it
    -- after styler has restored the global colorscheme (which it schedules),
    -- so that groups the theme leaves undefined do not render in the global
    -- theme's colours.
    local theme = require 'styler.theme'
    local load = theme.load
    theme.load = function(...)
      local ns = load(...)
      vim.schedule(function()
        require('custom.styler_fill').fill(ns)
      end)
      return ns
    end

    require('styler').setup {
      themes = {
        go = { colorscheme = 'tokyonight-storm' },
        javascript = { colorscheme = 'neosolarized' },
        javascriptreact = { colorscheme = 'neosolarized' },
        typescript = { colorscheme = 'neosolarized' },
        typescriptreact = { colorscheme = 'neosolarized' },
        lua = { colorscheme = 'tokyonight-moon' },
        python = { colorscheme = 'kanagawa' },
        sh = { colorscheme = 'vim' },
        awk = { colorscheme = 'vim' },
      },
    }
  end,
}
