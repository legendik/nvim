return {
  'catppuccin/nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    require('catppuccin').setup {
      flavour = 'macchiato',
    }

    vim.cmd.colorscheme 'catppuccin'
  end,
}
