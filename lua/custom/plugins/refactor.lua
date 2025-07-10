return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  lazy = false,
  opts = {},
  config = function()
    require('refactoring').setup({})
    
    -- Load telescope extension
    require('telescope').load_extension('refactoring')
    
    local wk = require('which-key')
    
    -- Refactoring operations group
    wk.add({
      { "<leader>r", group = "[R]efactor" },
      { "<leader>re", ":Refactor extract ", desc = "[R]efactor [E]xtract Function", mode = { "n", "x" } },
      { "<leader>rf", ":Refactor extract_to_file ", desc = "[R]efactor Extract to [F]ile", mode = { "n", "x" } },
      { "<leader>rv", ":Refactor extract_var ", desc = "[R]efactor Extract [V]ariable", mode = { "n", "x" } },
      { "<leader>ri", ":Refactor inline_var", desc = "[R]efactor [I]nline Variable", mode = { "n", "x" } },
      { "<leader>rI", ":Refactor inline_func", desc = "[R]efactor [I]nline Function", mode = "n" },
      { "<leader>rb", ":Refactor extract_block", desc = "[R]efactor Extract [B]lock", mode = "n" },
      { "<leader>rbf", ":Refactor extract_block_to_file", desc = "[R]efactor Extract [B]lock to [F]ile", mode = "n" },
      { "<leader>rr", function() require('refactoring').select_refactor() end, desc = "[R]efactor [R]efactor Menu", mode = { "n", "x" } },
    })
    
    -- Debug operations group
    wk.add({
      { "<leader>rd", group = "[R]efactor [D]ebug" },
      { "<leader>rp", function() require('refactoring').debug.printf({below = false}) end, desc = "[R]efactor Debug [P]rintf", mode = "n" },
      { "<leader>rdv", function() require('refactoring').debug.print_var() end, desc = "[R]efactor [D]ebug [V]ariable", mode = { "x", "n" } },
      { "<leader>rc", function() require('refactoring').debug.cleanup({}) end, desc = "[R]efactor Debug [C]leanup", mode = "n" },
    })
  end,
}
