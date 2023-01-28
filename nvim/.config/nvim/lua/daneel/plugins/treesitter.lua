return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    ensure_installed = {
      "lua",
      "php",
      "rust",
    },
    opts = function(plugin)
      require("nvim-treesitter.configs").setup({
        ensure_installed = plugin.ensure_installed,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
