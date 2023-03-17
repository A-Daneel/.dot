return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      local tokyonight = require("tokyonight")
      tokyonight.setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "dark",
        },
      })
      tokyonight.load()
    end,
  },
}
