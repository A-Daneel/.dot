return {
  -- markdown preview
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    keys = {
      {
        "<leader>om",
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
  -- latex preview
  {
    "lervag/vimtex",
    lazy = false, --plugin say's this is needed. I dislike it
  },
}
