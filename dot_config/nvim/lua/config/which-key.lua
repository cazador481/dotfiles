local wk = require("which-key")
wk.setup()
wk.register(
{ ['<leader>t'] = {
      name = "Test",
      a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
      f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
      F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
      l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
      L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
      n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
      N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
      o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
      O = { "<cmd>lua require('neotest').output.open({ open_win = function() vim.cmd('bo split') end})<cr>", "Split Output" },

      S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
      s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
      -- p = { "<Plug>PlenaryTestFile", "PlenaryTestFile" },
      -- v = { "<cmd>TestVisit<cr>", "Visit" },
      -- x = { "<cmd>TestSuite<cr>", "Suite" },
    },
})
