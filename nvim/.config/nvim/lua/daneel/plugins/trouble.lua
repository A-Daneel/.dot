---@module "lazy"
---@type LazySpec[]
return {
  "folke/trouble.nvim",
  event = "LspAttach",
  ---@module "trouble"
  ---@type trouble.Config
  opts = {
    ---@type table <string, trouble.Mode>
    modes = {
      diagnostics = {
        focus = false,
        win = {
          position = "bottom",
          size = { height = 0.25 },
        },
      },
      symbols = {
        focus = false,
        win = {
          position = "right",
          size = { width = 0.35 },
        },
      },
    },
  },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
  },
}
