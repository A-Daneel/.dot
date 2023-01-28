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
}
