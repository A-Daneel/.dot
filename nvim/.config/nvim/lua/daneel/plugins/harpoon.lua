return {
  {
    "theprimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon.mark").add_file()
        end,
        { desc = "Poon a file" },
      },
      {
        "<A-e>",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        { desc = "Toggle Harpoon menu" },
      },

      {
        "<C-h>",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        { desc = "Navigate to first file" },
      },
      {
        "<C-j>",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        { desc = "Navigate to second file" },
      },
      {
        "<C-k>",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        { desc = "Navigate to third file" },
      },
      {
        "<C-l>",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        { desc = "Navigate to fourth file" },
      },
    },
  },
}
