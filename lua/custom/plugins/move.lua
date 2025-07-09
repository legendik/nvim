return {
  'fedepujol/move.nvim',
  opts = {},
  config = function()
    require('move').setup {}

    local wk = require 'which-key'

    wk.add {
      { '<D-j>', ':MoveLine(1)<CR>', desc = 'Move line down', mode = 'n' },
      { '<D-k>', ':MoveLine(-1)<CR>', desc = 'Move line up', mode = 'n' },
      { '<D-h>', ':MoveHChar(-1)<CR>', desc = 'Move character left', mode = 'n' },
      { '<D-l>', ':MoveHChar(1)<CR>', desc = 'Move character right', mode = 'n' },
      { '<leader>wf', ':MoveWord(1)<CR>', desc = 'Move word forward', mode = 'n' },
      { '<leader>wb', ':MoveWord(-1)<CR>', desc = 'Move word backward', mode = 'n' },

      { '<D-j>', ':MoveBlock(1)<CR>', desc = 'Move block down', mode = 'v' },
      { '<D-k>', ':MoveBlock(-1)<CR>', desc = 'Move block up', mode = 'v' },
      { '<D-h>', ':MoveHBlock(-1)<CR>', desc = 'Move block left', mode = 'v' },
      { '<D-l>', ':MoveHBlock(1)<CR>', desc = 'Move block right', mode = 'v' },
    }
  end,
}
