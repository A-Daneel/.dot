return {
  -- markdown preview
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    opts = { theme = "light" },
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
  },
  -- latex preview
  {
    "lervag/vimtex",
    ft = "tex",
  },
}
