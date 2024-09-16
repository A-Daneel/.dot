---@module "lazy"
---@type LazySpec[]
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local tokyonight = require("tokyonight")
      ---@type tokyonight.Config
      local tokyoConfig = {
        style = "night",
        styles = {
          sidebars = "transparent",
          floats = "dark",
        },
        transparent = true,
      }
      tokyonight.setup(tokyoConfig)
      tokyonight.load()
    end,
  },
}
