return {
  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ---@type HarpoonConfig
      ---@diagnostic disable-next-line: missing-fields
    opts = {
      ---@diagnostic disable-next-line: missing-fields
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    },
    keys = function()
      local harpoon = require("harpoon")
      return {
        {
          "<leader>a",
          function()
            harpoon:list():append()
          end,
          desc = "Poon a file",
        },
        {
          "<A-e>",
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Toggle Harpoon menu",
        },
        {
          "<C-h>",
          function()
            harpoon:list():select(1)
          end,
          desc = "Navigate to first file",
        },
        {
          "<C-j>",
          function()
            harpoon:list():select(2)
          end,
          desc = "Navigate to second file",
        },
        {
          "<C-k>",
          function()
            harpoon:list():select(3)
          end,
          desc = "Navigate to third file",
        },
        {
          "<C-l>",
          function()
            harpoon:list():select(4)
          end,
          desc = "Navigate to fourth file",
        },
      }
    end,
  },
}
