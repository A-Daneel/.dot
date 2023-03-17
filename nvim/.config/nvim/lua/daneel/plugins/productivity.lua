return {
  -- ZEN!
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        width = 90,
        options = {
          number = true,
          relativenumber = true,
        },
      },
    },
    keys = {
      { "<leader>zz", "<cmd>ZenMode<cr>", desc = "ZenMode" },
    },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>rp",
        function()
          require("refactoring").debug.printf({ below = true })
        end,
        desc = "Refactor printf",
      },
      {
        "<leader>rc",
        function()
          require("refactoring").debug.cleanup({})
        end,
        desc = "Refactor cleanup",
      },
      {
        "<leader>rv",
        function()
          require("refactoring").debug.print_var({ normal = true })
        end,
        desc = "Refactor cleanup",
      },
      {
        "<leader>rv",
        function()
          require("refactoring").debug.print_var({})
        end,
        desc = "Refactor cleanup",
      },
    },
  },
}
