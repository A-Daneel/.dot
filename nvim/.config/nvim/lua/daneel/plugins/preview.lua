return {
  -- markdown preview
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    keys = {
      {
        "<leader>sm",
        function()
          local peek = require("peek")
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = "Peek (Markdown Preview)",
      },
    },
    opts = { theme = "light" },
  },
  -- jypyter
  {
    "dccsillag/magma-nvim",
    build = "UpdateRemotePlugins",
  },
  -- latex preview
  {
    "lervag/vimtex",
    ft = "tex",
    keys = {
      {
        "<leader>st",
        "<cmd>VimtexCompile<cr>",
        desc = "Vimtex (latex preview)",
      },
    },
  },
}
