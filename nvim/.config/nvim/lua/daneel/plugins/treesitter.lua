---@module "lazy"
---@type LazySpec[]
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy", "BufReadPost", "BufNewFile", "BufWritePre" },
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      highlight = {
        enable = true,
        disable = { "latex" },
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "lua",
        "php",
        "rust",
      },
    },
    ---@param opts TSConfig
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  },
}
