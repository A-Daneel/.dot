---@module "lazy"
---@type LazySpec[]
return {
  "folke/zen-mode.nvim",
  ---@module "zen-mode"
  ---@type ZenOptions
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    window = {
      options = {
        number = true,
        relativenumber = true,
      },
      width = 90,
    },
  },
  keys = {
    { "<leader>zz", "<cmd>ZenMode<cr>", desc = "ZenMode" },
  },
}
