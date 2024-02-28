return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  ---@type ZenOptions
    ---@diagnostic disable-next-line: missing-fields
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
}
