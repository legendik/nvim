return {
  'ahmedkhalf/project.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'folke/which-key.nvim',
  },
  config = function()
    require('project_nvim').setup {
      -- Manual mode doesn't automatically change your root directory, so you have
      -- the option to manually do so using `:ProjectRoot` command.
      manual_mode = false,

      -- Methods of detecting the root directory. **"lsp"** uses the native neovim
      -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
      -- order matters: if one is not detected, the other is used as fallback.
      detection_methods = { 'lsp', 'pattern' },

      -- All the patterns used to detect root dir, when **"pattern"** is in
      -- detection_methods
      patterns = { '.git' },

      -- Table of lsp clients to ignore by name
      -- eg: { "efm", ... }
      ignore_lsp = {},

      -- Don't calculate root dir on specific directories
      -- Ex: { "~/.cargo/*", ... }
      exclude_dirs = {
        '~/go/pkg/*',
        '~/go/src/*',
        '**/vendor/*',
        '**/go/pkg/mod/*',
      },

      -- Show hidden files in telescope
      show_hidden = false,

      -- When set to false, you will get a message when project.nvim changes your
      -- directory.
      silent_chdir = true,

      -- What scope to change the directory, valid options are
      -- * global (default)
      -- * tab
      -- * win
      scope_chdir = 'global',

      -- Path where project.nvim will store the project history for use in
      -- telescope
      datapath = vim.fn.stdpath 'data',
    }

    -- Telescope integration
    require('telescope').load_extension 'projects'

    -- Which-key integration
    local wk = require 'which-key'
    wk.add {
      { '<leader>sp', '<cmd>Telescope projects<cr>', desc = 'Search Projects' },
    }
  end,
}
